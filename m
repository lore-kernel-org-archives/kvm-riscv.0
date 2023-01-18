From: Conor Dooley <conor@kernel.org>
Date: Wed, 18 Jan 2023 22:28:51 +0000
Subject: [PATCH v4 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
In-Reply-To: <20230115154953.831-6-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-6-jszhang@kernel.org>
Message-ID: <Y8hyo573/Ts6K80s@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 15, 2023 at 11:49:45PM +0800, Jisheng Zhang wrote:
> riscv_cpufeature_patch_func() currently only scans a limited set of
> cpufeatures, explicitly defined with macros. Extend it to probe for all
> ISA extensions.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

With the same rationale as 6/13:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230118/375056eb/attachment.sig>
