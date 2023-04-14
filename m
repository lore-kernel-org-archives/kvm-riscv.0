From: Conor Dooley <conor@kernel.org>
Date: Fri, 14 Apr 2023 16:47:13 -0000
Subject: [PATCH -next v18 07/20] riscv: Introduce riscv_v_vsize to record
 size of Vector context
In-Reply-To: <20230414155843.12963-8-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-8-andy.chiu@sifive.com>
Message-ID: <20230414-kerosene-jackknife-2bf17e228b1d@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 14, 2023 at 03:58:30PM +0000, Andy Chiu wrote:

> +	if (riscv_v_vsize != this_vsize) {
> +		WARN(1, "RISCV_ISA_V only supports one vlenb on SMP system");

nit: systems
Clearly I don't expect a resubmission to change that!

You can re-add:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230414/356c7c6a/attachment-0001.sig>
