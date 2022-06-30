From: Michael S. Tsirkin <mst@redhat.com>
Date: Thu, 30 Jun 2022 15:20:42 -0400
Subject: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
In-Reply-To: <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com>
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s>
 <bf87a50c-6d92-8657-72a9-75af81d2489f@foss.st.com>
 <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com>
Message-ID: <20220630152003-mutt-send-email-mst@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 30, 2022 at 11:51:30AM -0600, Mathieu Poirier wrote:
> + virtualization at lists.linux-foundation.org
> + jasowang at redhat.com
> + mst at redhat.com
> 
> On Thu, 30 Jun 2022 at 10:20, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > Hi,
> >
> > On 6/29/22 19:43, Mathieu Poirier wrote:
> > > Hi Anup,
> > >
> > > On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> > >> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> > >> fails due to both virtqueues (Rx and Tx) marked as broken by the
> > >> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> > >> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> > >>
> > >> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> > >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > >> ---
> > >>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > >> index 905ac7910c98..71a64d2c7644 100644
> > >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > >> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > >>      /* and half is dedicated for TX */
> > >>      vrp->sbufs = bufs_va + total_buf_space / 2;
> > >>
> > >> +    /* From this point on, we can notify and get callbacks. */
> > >> +    virtio_device_ready(vdev);
> > >> +
> > >
> > > Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> > > potentially be called (by way of rpmsg_recv_done()), which will race with
> > > virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> > > rpmsg_recv_done() will fail, potentially breaking remote processors' state
> > > machines that don't expect their initial name service to fail when the "device"
> > > has been marked as ready.
> > >
> > > What does make me curious though is that nobody on the remoteproc mailing list
> > > has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> > > i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> > > their rig?
> >
> > I tested on STm32mp1 board using tag v5.19-rc4(03c765b0e3b4)
> > I confirm the issue!
> >
> > Concerning the solution, I share Mathieu's concern. This could break legacy.
> > I made a short test and I would suggest to use __virtio_unbreak_device instead, tounbreak the virtqueues without changing the init sequence.
> >
> > I this case the patch would be:
> >
> > +       /*
> > +        * Unbreak the virtqueues to allow to add buffers before setting the vdev status
> > +        * to ready
> > +        */
> > +       __virtio_unbreak_device(vdev);
> > +
> >
> >         /* set up the receive buffers */
> >         for (i = 0; i < vrp->num_bufs / 2; i++) {
> >                 struct scatterlist sg;
> >                 void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> 
> This will indeed fix the problem.  On the flip side the kernel
> documentation for __virtio_unbreak_device() puzzles me...
> It clearly states that it should be used for probing and restoring but
> _not_ directly by the driver.  Function rpmsg_probe() is part of
> probing but also the entry point to a driver.
> 
> Michael and virtualisation folks, is this the right way to move forward?

I don't think it is, __virtio_unbreak_device is intended for core use.

> >
> > Regards,
> > Arnaud
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > >>      /* set up the receive buffers */
> > >>      for (i = 0; i < vrp->num_bufs / 2; i++) {
> > >>              struct scatterlist sg;
> > >> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > >>       */
> > >>      notify = virtqueue_kick_prepare(vrp->rvq);
> > >>
> > >> -    /* From this point on, we can notify and get callbacks. */
> > >> -    virtio_device_ready(vdev);
> > >> -
> > >>      /* tell the remote processor it can start sending messages */
> > >>      /*
> > >>       * this might be concurrent with callbacks, but we are only
> > >> --
> > >> 2.34.1
> > >>


