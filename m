From: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 04 Apr 2023 11:59:08 -0000
Subject: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
In-Reply-To: <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
 <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
 <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
 <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
 <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
Message-ID: <20230404-5cfffb017198773dc3e81dab@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 04, 2023 at 01:52:43PM +0200, Andrew Jones wrote:
> On Mon, Apr 03, 2023 at 02:23:01PM +0200, Andrew Jones wrote:

> > It's probably best if neither depend on each other, since they're
> > independent, but otherwise the order doesn't matter. It'd be nice to call
> > the order out in the cover letter to give patchwork a chance at automatic
> > build testing, though. To call it out, I believe adding
> > 
> > Based-on: 20230401112730.2105240-1-apatel at ventanamicro.com
> > 
> > to the cover letter should work.
> 
> I also just noticed that this based on "RISC-V: KVM: Add ONE_REG
> interface to enable/disable SBI extensions"[1] and it needs to be
> in order to pick up the KVM_REG_RISCV_SUBTYPE_MASK and
> KVM_REG_RISCV_SUBTYPE_SHIFT defines. It'd be good to call that
> patch out with Based-on.
> 
> [1]: 20230331174542.2067560-2-apatel at ventanamicro.com

I've been waiting for a review on that for a while.. It's been 3
weeks, so just gonna merge it and see what breaks!
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230404/6a76b5b2/attachment-0001.sig>
