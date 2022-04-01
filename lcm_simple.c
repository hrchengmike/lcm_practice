#include <lcm/lcm.h>
#include "l2g_t.h"
#include <stdio.h>

void on_l2g(const lcm_recv_buf_t *rbuf, const char *channel,
            const l2g_t *msg, void *userdata){
                printf("Message received, %.2f %.2f %.2f \n", msg->l2g[0], msg->l2g[1], msg->l2g[2]);
            }

int main(void) {
    printf("lcm_simple started\n");
    // we could also pass in a string of settings for special LCM configuration
    // and that would be helpful to configure a multi-robot communication scenario
    lcm_t *lcm = lcm_create(NULL);
    if(!lcm){return 1;}

    //Subscriber
    l2g_t_subscription_t *l2g_sub = l2g_t_subscribe(lcm, "L2G", on_l2g, NULL);

    //Initialize message
    l2g_t l2g_msg;
    l2g_msg.utime = 0;
    l2g_msg.l2g[0] = 1.0;
    l2g_msg.l2g[1] = 2.0;
    l2g_msg.l2g[2] = 3.0;

    //Publisher
    l2g_t_publish(lcm, "L2G", &l2g_msg);

    while(1){
        lcm_handle(lcm);
    }
    lcm_destroy(lcm);
    return 0;
}