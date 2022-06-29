From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Jun 2022 11:43:18 -0600
Subject: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
In-Reply-To: <20220608171334.730739-1-apatel@ventanamicro.com>
References: <20220608171334.730739-1-apatel@ventanamicro.com>
Message-ID: <20220629174318.GB2018382@p14s>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> fails due to both virtqueues (Rx and Tx) marked as broken by the
> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> 
> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 905ac7910c98..71a64d2c7644 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	/* and half is dedicated for TX */
>  	vrp->sbufs = bufs_va + total_buf_space / 2;
>  
> +	/* From this point on, we can notify and get callbacks. */
> +	virtio_device_ready(vdev);
> +

Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
potentially be called (by way of rpmsg_recv_done()), which will race with
virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
rpmsg_recv_done() will fail, potentially breaking remote processors' state
machines that don't expect their initial name service to fail when the "device"
has been marked as ready.

What does make me curious though is that nobody on the remoteproc mailing list
has complained about commit 8b4ec69d7e09 breaking their environment... By now,
i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
their rig?

Thanks,
Mathieu

>  	/* set up the receive buffers */
>  	for (i = 0; i < vrp->num_bufs / 2; i++) {
>  		struct scatterlist sg;
> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	 */
>  	notify = virtqueue_kick_prepare(vrp->rvq);
>  
> -	/* From this point on, we can notify and get callbacks. */
> -	virtio_device_ready(vdev);
> -
>  	/* tell the remote processor it can start sending messages */
>  	/*
>  	 * this might be concurrent with callbacks, but we are only
> -- 
> 2.34.1
> 

