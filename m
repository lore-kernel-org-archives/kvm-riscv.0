From: Conor Dooley <conor@kernel.org>
Date: Fri, 27 Jan 2023 22:53:05 +0000
Subject: [PATCH v3 03/14] RISC-V: Improve SBI PMU extension related
 definitions
In-Reply-To: <20230127182558.2416400-4-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
 <20230127182558.2416400-4-atishp@rivosinc.com>
Message-ID: <Y9RV0cOMld20EFBI@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yo Atish,

On Fri, Jan 27, 2023 at 10:25:47AM -0800, Atish Patra wrote:
> This patch fixes/improve few minor things in SBI PMU extension
> definition.
> 
> 1. Align all the firmware event names.

> @@ -171,7 +171,7 @@ enum sbi_pmu_fw_generic_events_t {
>  	SBI_PMU_FW_IPI_RECVD		= 7,
> -	SBI_PMU_FW_FENCE_I_RECVD	= 9,
> +	SBI_PMU_FW_FENCE_I_RCVD		= 9,
>  	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,

Alignment looks incomplete to me! Looks like you went from 2 RECVD and
1 RCVD to 2 RCVD and 1 RECVD! FWIW, the spec uses RECEIVED for all of
these:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#114-event-firmware-events-type-15

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230127/5f9422f1/attachment-0001.sig>
