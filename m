From: Michael S. Tsirkin <mst@redhat.com>
Date: Fri, 1 Jul 2022 05:39:01 -0400
Subject: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
In-Reply-To: <65d972ed-31b4-5636-86a3-dabd5f25a3be@foss.st.com>
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s>
 <20220630151716-mutt-send-email-mst@kernel.org>
 <65d972ed-31b4-5636-86a3-dabd5f25a3be@foss.st.com>
Message-ID: <20220701053813-mutt-send-email-mst@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 01, 2022 at 11:00:28AM +0200, Arnaud POULIQUEN wrote:
> Hello,
> 
> On 6/30/22 21:19, Michael S. Tsirkin wrote:
> > On Wed, Jun 29, 2022 at 11:43:18AM -0600, Mathieu Poirier wrote:
> >> Hi Anup,
> >>
> >> On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> >>> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> >>> fails due to both virtqueues (Rx and Tx) marked as broken by the
> >>> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> >>> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> >>>
> >>> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> >>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>> ---
> >>>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> index 905ac7910c98..71a64d2c7644 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>  	/* and half is dedicated for TX */
> >>>  	vrp->sbufs = bufs_va + total_buf_space / 2;
> >>>  
> >>> +	/* From this point on, we can notify and get callbacks. */
> >>> +	virtio_device_ready(vdev);
> >>> +
> >>
> >> Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> >> potentially be called (by way of rpmsg_recv_done()), which will race with
> >> virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> >> rpmsg_recv_done() will fail, potentially breaking remote processors' state
> >> machines that don't expect their initial name service to fail when the "device"
> >> has been marked as ready.
> > 
> > When you say available I am guessing you really need used.
> > 
> > With a non broken device you won't get a callback
> > until some buffers have been used.
> > 
> > Or, if no used buffers are present then you will get another
> > callback down the road.
> 
> In current implementation the Linux rpmsg_virtio driver allocates the
> virtio buffers for the coprocessor rpmsg virtio device transmission and
> then updates the virtio device status in shared memory to inform the
> coprocessor that it is ready for inter-processor communication.
> 
> So from coprocessor perspective, when the virtio device is ready
> (set to VIRTIO_CONFIG_S_DRIVER_OK), it can
> start to get available buffers and send virtio buffers to the Linux.
> 
> With the patch proposed, the virtio is set to VIRTIO_CONFIG_S_DRIVER_OK
> while no buffer are available for the coprocessor transmission.
> 
> I'm agree that, if the Linux rpmsg_virtio driver has not allocated the
> buffer, the coprocessor will fail to get available virtio buffer for
> communication and so has "just" to wait that some buffers are available
> in the virtqueue.
> 
> But this change the behavior and can lead to an unexpected error case
> for some legacy coprocessor firmware...
> Should we take the risk that this legacy is no longer compatible?
> 
> 
> That said regarding the virtio spec 1.1 chapter 3.1.1 [1], I also wonder
> if the introduction of the virqueue broken flag is compliant with the
> spec? 
> But i guess this is probably a matter of interpretation...
> 
> " 
> The driver MUST follow this sequence to initialize a device:
> [...]
> 7. Perform device-specific setup, including discovery of virtqueues for
> the device, optional per-bus setup, reading and possibly writing the
> device?s virtio configuration space, and population of virtqueues.
> 8. Set the DRIVER_OK status bit. At this point the device is ?live?.
> "
> 
> My question is what means in point 7. "and population of virtqueues"?
> 
> In my interpretation the call of "virtqueue_add_inbuf()" populates the
> RX virtqueue.
> That would mean that calling virtqueue_add_inbuf before calling 
> virtio_device_ready() should be possible.
> 
> Thanks,
> Arnaud 
> 
> [1]https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html#x1-920001

I think I agree. For example, the networking device uses "population" in this
sense:

	It is generally a good idea to keep the receive virtqueue as
	fully populated as possible: if it runs out, network performance
	will suffer.



> 
> > 
> > 
> >>
> >> What does make me curious though is that nobody on the remoteproc mailing list
> >> has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> >> i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> >> their rig?
> >>
> >> Thanks,
> >> Mathieu
> >>
> >>>  	/* set up the receive buffers */
> >>>  	for (i = 0; i < vrp->num_bufs / 2; i++) {
> >>>  		struct scatterlist sg;
> >>> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>  	 */
> >>>  	notify = virtqueue_kick_prepare(vrp->rvq);
> >>>  
> >>> -	/* From this point on, we can notify and get callbacks. */
> >>> -	virtio_device_ready(vdev);
> >>> -
> >>>  	/* tell the remote processor it can start sending messages */
> >>>  	/*
> >>>  	 * this might be concurrent with callbacks, but we are only
> >>> -- 
> >>> 2.34.1
> >>>
> >>
> > 


