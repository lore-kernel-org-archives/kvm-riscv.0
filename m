Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4751BC369C2
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICAO36aiJoil4NBHhMdgPBcEAn+Cz+t3q+V/LC3VALo=; b=lRxS4iVvv2nxRi
	zhDPd1glYJK4Tsb+H8AUa5Kd2oQnybBbS45MB5Ro0pCjz3yHBhujG5kpGt2XPpt53RrxjVa8gTmrg
	YlZux1CwxhF0iLMxO/phQUu0jfX3BpnyMSksF7R5zq06OOBPor7CDjYwDxmbYaFQLXwZbshEWb1tR
	KwgYWGPaJz1tIwRN10+M8yUJlC/TIjZR1c+LzbE/tn5IFxz80qtbl5oUMmXi/9O0YDk57YSVmBHzl
	JCsq1rLHvEt/NZJiNqEyz7ydKvd2fRYlLZzG4dZmi1+D2Uu/CC0REN+kMBlWw9iC6g9gSdr7ccqzh
	SeF0BAHcAYlFXAoKpI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LLs-0000000072H-2UzU;
	Fri, 25 Apr 2025 15:52:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JBl-0000000HIan-2B1V
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 13:33:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1719741f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745588036; x=1746192836; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fvxSe8a/Se9B7XO1sswsds6D5F7SBQkR6pj1GPZGuF4=;
        b=abHNYf1wegP501MZWrfxiHgpU5tY1xJFO082GVDSiCKnvkp5kc6cPG7Doa6+71Z76t
         ysHBAdv9RSAMfoiK46TPStsf1ar0w4U6DlPVDPQDmOC0hLFo9TSlsOJjmzCOS+bSpWC1
         rFIjeqUp+92W4PDCdsLDzPDLNxg+xCyJeJwtKeKZkRFRlvKd5nt0Ao9E7+1RRSahOZCS
         89+5ALA7VCQs88G1s2EkSPR2H+QK0//kjsDks2GoMFkfXvFToP3t0qsPlVOFf5mpCqQN
         FEIrTlOlfacP101T7BJ+1wpA2SdlISdikPsTjypwcS+x8otlQV8j22ozSSyLn+mr6RqI
         8qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588036; x=1746192836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvxSe8a/Se9B7XO1sswsds6D5F7SBQkR6pj1GPZGuF4=;
        b=I52Kgb7gR5r1vcF5X1XuLoUIFH4GK0nRsXw3PR1HDQBDUbd4PJTWiDMBNPLCnV+YDX
         nyV0k/0HTlp5OKJDoTK1XTxW629NS8HDRTrAMgP6g2PYeaXA9NC/dlJ4cIJh8XJp7EhZ
         ZfR1ycqN7xebN5Pp+ExqXhLnqL7HOCuM3XDxxEDV6MHAIBo+R9UL6bTEtz8O2BK2cQfl
         oE4fxjrC4voKpio8JrjnZ4x//hF2IkAkTJwHbGgpKPkfkwGAZ6CnyFvJ4s1aHZkOqJ74
         nDi2rru1bd+e3GONcJEiX/zzp4CwRW82OpsyqcyrGgeIPvNnIPa4TL438H17BCN3V20g
         yDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX19hJfd3zdleFea9G9ZV3cXxe9IAVVaqd2yMOBKkF+vKVVduouEhwMQyEtmaRsQH0+6PZ/Ior+2GQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj48FfbqnAYzRr0sSb7oExSNC3YUF1A6flGBX5cSKNnGNvzHtz
	47n1RYyePbT6iSh9yXzjKRULpcC0KFStN9CdlYB96T4KzCGSTJfuoCvlj18c73A=
X-Gm-Gg: ASbGncv/No3Mx+CaHC0Jlv+JbEjxLHQJWfgD7G0DE8Fq97FSLhMiJDEorwkpVqsV3XW
	CQ0bCer3x3gOtdOFeg+gYdkO/LT8OKbsaCADsqBanmNWsXjvCYaVXOmxDxNKGyB80ltGlvfyO+a
	M0/K3tW8MCHh/wVf/6KBDi3N6U3DtnKMb62/RSiizMcavDVNQelYAE3ESXogOPr89v31hFN+ovL
	fsyxAS/yGiGBPZhKYoOBUxVN0f88wINvmlP1lqwS9o9mOB9B2UptLeyJrhq8HpJLPbXrxfhyzog
	jjOALlPy3cjOvKEvP3LfAcjZyv2e
X-Google-Smtp-Source: AGHT+IH345KXBx7WTUF/NPXxKh0vTQxkkkmRW+ErxhOe06A807pl+3G2m+RyiKZsRHwXpurwjK/pVQ==
X-Received: by 2002:a05:6000:1867:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-3a074e37776mr2084638f8f.25.1745588035744;
        Fri, 25 Apr 2025 06:33:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm2467062f8f.30.2025.04.25.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:55 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:33:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] KVM: riscv: selftests: Decode stval to identify
 exact exception type
Message-ID: <20250425-f458b9801a83cc35bda55c74@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_063357_574084_A700509A 
X-CRM114-Status: GOOD (  20.68  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 24, 2025 at 05:40:30PM -0700, Atish Patra wrote:
> Currently, the sbi_pmu_test continues if the exception type is illegal
> instruction because access to hpmcounter will generate that. However, we
> may get illegal for other reasons as well which should result in test
> assertion.
> 
> Use the stval to decode the exact type of instructions and which csrs are
> being accessed if it is csr access instructions. Assert in all cases
> except if it is a csr access instructions that access valid PMU related
> registers.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 32 ++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 03406de4989d..11bde69b5238 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -128,11 +128,43 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>  		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
>  }
>  
> +#define INSN_OPCODE_MASK	0x007c
> +#define INSN_OPCODE_SHIFT	2
> +#define INSN_OPCODE_SYSTEM	28
> +
> +#define INSN_MASK_FUNCT3	0x7000
> +#define INSN_SHIFT_FUNCT3	12
> +
> +#define INSN_CSR_MASK		0xfff00000
> +#define INSN_CSR_SHIFT		20
> +
> +#define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHIFT_FUNCT3)
> +#define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SHIFT)

It'd be good to put these macros in include/riscv/processor.h or some new
include/riscv/ header to be shared with other tests that may want to
decode stval.

Thanks,
drew

> +
>  static void guest_illegal_exception_handler(struct ex_regs *regs)
>  {
> +	unsigned long insn;
> +	int opcode, csr_num, funct3;
> +
>  	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
>  		       "Unexpected exception handler %lx\n", regs->cause);
>  
> +	insn = regs->stval;
> +	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
> +	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
> +		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
> +
> +	csr_num = GET_CSR_NUM(insn);
> +	funct3 = GET_RM(insn);
> +	/* Validate if it is a CSR read/write operation */
> +	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 || funct3 != 4),
> +		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
> +		       funct3, csr_num);
> +
> +	/* Validate if it is a HPMCOUNTER CSR operation */
> +	__GUEST_ASSERT(csr_num == CSR_CYCLE || csr_num <= CSR_HPMCOUNTER31,
> +		       "Unexpected csr_num 0x%x\n", csr_num);
> +
>  	illegal_handler_invoked = true;
>  	/* skip the trapping instruction */
>  	regs->epc += 4;
> 
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
