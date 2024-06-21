From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 21 Jun 2024 09:01:05 +0100
Subject: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
In-Reply-To: <09f427cd-74ad-4aa5-81b1-995af2b6e1d1@ghiti.fr>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
 <09f427cd-74ad-4aa5-81b1-995af2b6e1d1@ghiti.fr>
Message-ID: <20240621-enchanted-unfasten-6d71b1ecd791@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 09:52:01AM +0200, Alexandre Ghiti wrote:
> On 05/06/2024 14:15, Yong-Xuan Wang wrote:
> > Svade and Svadu extensions represent two schemes for managing the PTE A/D
> > +/*
> > + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> > + * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> > + * DT.
> > + */
> > +#define arch_has_hw_pte_young arch_has_hw_pte_young
> > +static inline bool arch_has_hw_pte_young(void)
> > +{
> > +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU) &&
> > +	       !riscv_has_extension_likely(RISCV_ISA_EXT_SVADE);
> > +}
> 
> 
> AFAIK, the riscv_has_extension_*() macros will use the content of the
> riscv,isa string. So this works fine for now with the description you
> provided in the cover letter, as long as we don't have the FWFT SBI
> extension. I'm wondering if we should not make sure it works when FWFT lands
> because I'm pretty sure we will forget about this.
> 
> So I think we should check the availability of SBI FWFT and use some global
> variable that tells if svadu is enabled or not instead of this check.

No. If FWFT stuff arrives, it should be plumbed into exactly the same
interface. "Users" should not have to think about where the extension is
probed from and be able to use the same interface regardless.

The interfaces we have have already caused some confusion, we should not
make them worse.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240621/2537a5fe/attachment-0001.sig>
