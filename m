From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 20 Mar 2023 22:46:57 +0800
Subject: [PATCH -next v15 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <456a8e61-c6b7-46d5-a25c-c466820912d7@spud>
References: <20230317113538.10878-1-andy.chiu@sifive.com> <20230317113538.10878-9-andy.chiu@sifive.com>
 <456a8e61-c6b7-46d5-a25c-c466820912d7@spud>
Message-ID: <CABgGipVf3eTc9pj58wMYQr7NBcic+-m3fECEttqvPcn9Zu3qJw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 20, 2023 at 9:05?PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Fri, Mar 17, 2023 at 11:35:27AM +0000, Andy Chiu wrote:
> > From: Greentime Hu <greentime.hu@sifive.com>
> >
> > Add vector state context struct to be added later in thread_struct. And
> > prepare low-level helper functions to save/restore vector contexts.
> >
> > This include Vector Regfile and CSRs holding dynamic configuration state
> > (vstart, vl, vtype, vcsr). The Vec Register width could be implementation
> > defined, but same for all processes, so that is saved separately.
> >
> > This is not yet wired into final thread_struct - will be done when
> > __switch_to actually starts doing this in later patches.
> >
> > Given the variable (and potentially large) size of regfile, they are
> > saved in dynamically allocated memory, pointed to by datap pointer in
> > __riscv_v_ext_state.
> >
> > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>
> I think you missed a:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
>

Yes, removed it on purpose because I changed some inline assembly in
this submission. So I think you may want to take a look in case I did
something silly.

Thanks,
Andy.

