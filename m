From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 2 Feb 2023 11:33:53 +0000
Subject: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
In-Reply-To: <20230201231250.3806412-8-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-8-atishp@rivosinc.com>
Message-ID: <Y9ufoeZ/4obZDJz6@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
> This patch only adds barebone structure of perf implementation. Most of
> the function returns zero at this point and will be implemented
> fully in the future.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> +/* Per virtual pmu counter data */
> +struct kvm_pmc {
> +	u8 idx;
> +	struct perf_event *perf_event;
> +	uint64_t counter_val;

CI also complained that here, and elsewhere, you used uint64_t rather
than u64. Am I missing a reason for not using the regular types?

Thanks,
Conor.

> +	union sbi_pmu_ctr_info cinfo;
> +	/* Event monitoring status */
> +	bool started;
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230202/cbf4587b/attachment-0001.sig>
