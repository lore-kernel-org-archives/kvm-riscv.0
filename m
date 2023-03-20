From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 20 Mar 2023 14:55:20 -0000
Subject: [PATCH -next v15 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <CABgGipVf3eTc9pj58wMYQr7NBcic+-m3fECEttqvPcn9Zu3qJw@mail.gmail.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-9-andy.chiu@sifive.com>
 <456a8e61-c6b7-46d5-a25c-c466820912d7@spud>
 <CABgGipVf3eTc9pj58wMYQr7NBcic+-m3fECEttqvPcn9Zu3qJw@mail.gmail.com>
Message-ID: <bcf933bc-b8d6-4b34-82ac-e6f542542e25@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 20, 2023 at 10:46:57PM +0800, Andy Chiu wrote:
> On Mon, Mar 20, 2023 at 9:05?PM Conor Dooley <conor.dooley@microchip.com> wrote:
> >
> > On Fri, Mar 17, 2023 at 11:35:27AM +0000, Andy Chiu wrote:
> > > From: Greentime Hu <greentime.hu@sifive.com>
> > >
> > > Add vector state context struct to be added later in thread_struct. And
> > > prepare low-level helper functions to save/restore vector contexts.
> > >
> > > This include Vector Regfile and CSRs holding dynamic configuration state
> > > (vstart, vl, vtype, vcsr). The Vec Register width could be implementation
> > > defined, but same for all processes, so that is saved separately.
> > >
> > > This is not yet wired into final thread_struct - will be done when
> > > __switch_to actually starts doing this in later patches.
> > >
> > > Given the variable (and potentially large) size of regfile, they are
> > > saved in dynamically allocated memory, pointed to by datap pointer in
> > > __riscv_v_ext_state.
> > >
> > > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> > > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> >
> > I think you missed a:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks,
> > Conor.
> >
> 
> Yes, removed it on purpose because I changed some inline assembly in
> this submission. So I think you may want to take a look in case I did
> something silly.

Heh, inline asm is usually why I do "acked-by" rather than "reviewed-by"
as I am not particular confident in that realm ;)
No harm in being careful and dropping tags I suppose!
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230320/62c2be0a/attachment-0001.sig>
