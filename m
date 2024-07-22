From: Conor Dooley <conor@kernel.org>
Date: Mon, 22 Jul 2024 17:51:39 +0100
Subject: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <CAMWQL2iWsxLJZZ3H59csJ376Hdtq+ZKjD92BtM9zhdXm+fh2=A@mail.gmail.com>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com>
 <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
 <CAMWQL2g-peSYJQaxeJtyOzGdEmDQ6cnkRBdFQvLr2NQA1+mv2g@mail.gmail.com>
 <20240719-flatten-elixir-d4476977ab95@spud>
 <CAMWQL2iWsxLJZZ3H59csJ376Hdtq+ZKjD92BtM9zhdXm+fh2=A@mail.gmail.com>
Message-ID: <20240722-seizing-mardi-5237466fcf83@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 22, 2024 at 10:14:11AM +0800, Yong-Xuan Wang wrote:

> > > > > +        - const: svadu
> > > > > +          description: |
> > > > > +            The standard Svadu supervisor-level extension for hardware updating
> > > > > +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> > > > > +            #25 from ved-rivos/ratified") of riscv-svadu. Please refer to Svade
> > > >
> > > > Should we be referencing the archived riscv-svadu repository now that Svadu has
> > > > been merged to the main privileged ISA manual? Either way:
> > > >
> > > > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > > >
> > >
> > > Yes, this commit is from the archived riscv-svadu repo. Or should I update it to
> > > "commit c1abccf ("Merge pull request  #25 from ved-rivos/ratified") of
> > > riscvarchive/riscv-svadu."?
> >
> > I think Samuel was saying that we should use the commit where it was
> > merged into riscv-isa-manual instead.
> 
> Got it. I will update the description in the next version. Thank you!

There's no need (IMO) to send a new version for this alone - but if you
have to send another version for some other reason then do it.

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240722/f48b4498/attachment.sig>
