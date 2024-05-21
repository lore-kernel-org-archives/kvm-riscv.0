From: Conor Dooley <conor@kernel.org>
Date: Tue, 21 May 2024 20:49:19 +0100
Subject: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <20240517145302.971019-9-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-9-cleger@rivosinc.com>
Message-ID: <20240521-spiny-undergrad-efa1a391ad3d@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 17, 2024 at 04:52:48PM +0200, Cl?ment L?ger wrote:

> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
> +				 const unsigned long *isa_bitmap)
> +{
> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) ? 0 : -EPROBE_DEFER;
> +}
> +static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
> +				  const unsigned long *isa_bitmap)
> +{
> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
> +	       __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d) ? 0 : -EPROBE_DEFER;
> +}

Could you write the logic in these out normally please? I think they'd
be more understandable (particular this second one) broken down and with
early return.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240521/c0c71513/attachment.sig>
