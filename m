Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4888DC369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLhJMMVBdCEJGGg0XG6nX7JV9MMRuukM6wBV8fOlyo4=; b=3fokA7GeVbDtF/
	7vobt82bIBIHk7sYgCsCda/0VhaUTFT1mkIfMnnNXdEXpEuu76DlOKzbyLQbvY3zdiHpqglYM45h0
	W0CWBT+06w1yeMiiJ75hJPo4PQYlDri37+H4Q6R8WTAvj8nAOIRAxNMpF5iN55jocVm54PhcihPYa
	IKoj4Ouj/VrhWjeOOChbOxjCj2OaJni4UFjs3L0kFtwT6I5CCZ0k5PWBCLFxwRztkxy6P/UbPjs3P
	TPLnvM/21VSUDBnEqBPEHvHybVmVV7DP7a1Hj2i9tZ+/brHjOgDm/p1AXFhPNhqD1y1fDzOrBB5oE
	EV2neUwxsXKG7ZGaea9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vQL-0000000Dyjy-2upx;
	Thu, 24 Apr 2025 12:11:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tvW-0000000DhYO-0f8N
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 10:35:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so7877575e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 03:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745490928; x=1746095728; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8F14wHisZFmYUBGpNt7mOre3zxnZ1S4nyKvc0jYLFAs=;
        b=KqdOIBPEZtVa1yfmLr8pjce0uyJlVSt0myNM5xoheolbn6JrTBZlJRCkIx5zwBw+79
         aQ0gX5ZE5DT9NAbSWLuDYbw8iXgrRa4pdMmb5aJ5JjOEsATLSzTG2auDjAEvlQGzzDzD
         HB48TIsXZMIZr1v1KxqXWqV9x3hjQANFEgnEL5LUFrTEpZkFMsw4byJtJO2CIEILpevG
         yaMGYp05bwdGKZ7nQaoje+6msxu3LbTth8kIWzTx6/J6dQa1i5RqAPR9PiZC19/ksDhu
         cd2Q6x5hww9Ygabwff0mXqQ5OZUh5/EWNiaelJk2jmsmokyQvMsJjnKjY5iRFutLeRaA
         itEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490928; x=1746095728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F14wHisZFmYUBGpNt7mOre3zxnZ1S4nyKvc0jYLFAs=;
        b=ixfRXuDiur3ISihqY9ArvSWkAINwXjz96OHtaZcMsI09EtTxaHA4vhOa7g0vO4HaOk
         ukW+8DXVf6idvvmTGXL290uFCgk1kxPhpluHYQHU5NTUZOuW5lvOKKPrrxdAVLkMkqcc
         N/pVrOZH6MJ5h0oarr8UMTj3u036NRqkCLD9M9bgRarygcvL1XSXeU2H716q7Zf86tkH
         zCz1l5S2Se6QFADTt2KZY9jtTUPjGxVhYX7BZYsrf9SoJXSUOPK4Zf6jt1DQ0QlppSRb
         iXsUSfPFxOklMQV97Qah+EkEKU337l8Bvt6pM+7zwS+ryR4DFXgJ4VE7lH7rWsmcY/J+
         Vlkw==
X-Forwarded-Encrypted: i=1; AJvYcCWByMVMxUyRRz8PZNUFxlHeosuRFD7wcT449cc8pCSdbkFW0MLkoGC9/srNBBFldg4Bpx5bqr7s2zQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK1wFmIjxWetRmkB4UVNQYhhoyo5sOtYABjLwuCiDi+N9JP+CA
	1QjX38Rc4OoOJsGTFeSQFF+S1WrFmvruC9ElD5I0aW2/hfXh05uVoh3RxVU+Hhc=
X-Gm-Gg: ASbGncuYPHC6OETl6ZKZTpJ5J9Bop3e4jqCxFCFKeEg5EhKhr+lxE6JL1kaoiubm/fN
	lOc/FlvV+TWPCk8Um/VQXFFesoLX6z22kbkg/op7GxomjwMm/bx+S/cbRUQzaeRr37md3wNw41D
	oyDbsbf/ihPTCq7CfZIegfBf1OS4b24MhLVH9i/aMA80O7v4sc8E8KHE5tSfEo2j7nfsugUeNyo
	kup8XulooPBvP+zSHWVGyWDOr7Y7Ghh6aw1bxed0jSxO267JYPyaXhj2VVTr5w0JD1byVZATWYT
	ZMg13GhCC4RyknA3eTLxASBBbK/M
X-Google-Smtp-Source: AGHT+IGoQMYnbzGX//fc6ZE1xJ+4fax/Zt5gY/4Qwi4Zg11qB7T5+TDbupkwgT7lpU1WNNtKSDFW5Q==
X-Received: by 2002:a05:600c:83ca:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-4409bd76dedmr20044925e9.24.1745490927855;
        Thu, 24 Apr 2025 03:35:27 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2dfc2fsm15232015e9.33.2025.04.24.03.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:35:27 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:35:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] riscv: Move all duplicate insn parsing macros into
 asm/insn.h
Message-ID: <20250424-097fbd2d0fa5f8c14adc5054@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422082545.450453-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_033530_225741_824077C5 
X-CRM114-Status: GOOD (  15.89  )
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

On Tue, Apr 22, 2025 at 10:25:45AM +0200, Alexandre Ghiti wrote:
> kernel/traps_misaligned.c and kvm/vcpu_insn.c define the same macros to
> extract information from the instructions.
> 
> Let's move the definitions into asm/insn.h to avoid this duplication.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h        | 164 +++++++++++++++++++++++++++
>  arch/riscv/kernel/elf_kexec.c        |   1 +
>  arch/riscv/kernel/traps_misaligned.c | 136 +---------------------
>  arch/riscv/kvm/vcpu_insn.c           | 127 +--------------------
>  4 files changed, 167 insertions(+), 261 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 4063ca35be9b..35f316cdd699 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -286,9 +286,173 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>  	       (code & RVC_INSN_J_RS1_MASK) != 0;
>  }
>  
> +#define INSN_MATCH_LB		0x3
> +#define INSN_MASK_LB		0x707f
> +#define INSN_MATCH_LH		0x1003
> +#define INSN_MASK_LH		0x707f
> +#define INSN_MATCH_LW		0x2003
> +#define INSN_MASK_LW		0x707f
> +#define INSN_MATCH_LD		0x3003
> +#define INSN_MASK_LD		0x707f
> +#define INSN_MATCH_LBU		0x4003
> +#define INSN_MASK_LBU		0x707f
> +#define INSN_MATCH_LHU		0x5003
> +#define INSN_MASK_LHU		0x707f
> +#define INSN_MATCH_LWU		0x6003
> +#define INSN_MASK_LWU		0x707f
> +#define INSN_MATCH_SB		0x23
> +#define INSN_MASK_SB		0x707f
> +#define INSN_MATCH_SH		0x1023
> +#define INSN_MASK_SH		0x707f
> +#define INSN_MATCH_SW		0x2023
> +#define INSN_MASK_SW		0x707f
> +#define INSN_MATCH_SD		0x3023
> +#define INSN_MASK_SD		0x707f
> +
> +#define INSN_MATCH_C_LD		0x6000
> +#define INSN_MASK_C_LD		0xe003
> +#define INSN_MATCH_C_SD		0xe000
> +#define INSN_MASK_C_SD		0xe003
> +#define INSN_MATCH_C_LW		0x4000
> +#define INSN_MASK_C_LW		0xe003
> +#define INSN_MATCH_C_SW		0xc000
> +#define INSN_MASK_C_SW		0xe003
> +#define INSN_MATCH_C_LDSP	0x6002
> +#define INSN_MASK_C_LDSP	0xe003
> +#define INSN_MATCH_C_SDSP	0xe002
> +#define INSN_MASK_C_SDSP	0xe003
> +#define INSN_MATCH_C_LWSP	0x4002
> +#define INSN_MASK_C_LWSP	0xe003
> +#define INSN_MATCH_C_SWSP	0xc002
> +#define INSN_MASK_C_SWSP	0xe003
> +
> +#define INSN_OPCODE_MASK	0x007c
> +#define INSN_OPCODE_SHIFT	2
> +#define INSN_OPCODE_SYSTEM	28
> +
> +#define INSN_MASK_WFI		0xffffffff
> +#define INSN_MATCH_WFI		0x10500073
> +
> +#define INSN_MASK_WRS		0xffffffff
> +#define INSN_MATCH_WRS		0x00d00073
> +
> +#define INSN_MATCH_CSRRW	0x1073
> +#define INSN_MASK_CSRRW		0x707f
> +#define INSN_MATCH_CSRRS	0x2073
> +#define INSN_MASK_CSRRS		0x707f
> +#define INSN_MATCH_CSRRC	0x3073
> +#define INSN_MASK_CSRRC		0x707f
> +#define INSN_MATCH_CSRRWI	0x5073
> +#define INSN_MASK_CSRRWI	0x707f
> +#define INSN_MATCH_CSRRSI	0x6073
> +#define INSN_MASK_CSRRSI	0x707f
> +#define INSN_MATCH_CSRRCI	0x7073
> +#define INSN_MASK_CSRRCI	0x707f
> +
> +#define INSN_MATCH_FLW			0x2007
> +#define INSN_MASK_FLW			0x707f
> +#define INSN_MATCH_FLD			0x3007
> +#define INSN_MASK_FLD			0x707f
> +#define INSN_MATCH_FLQ			0x4007
> +#define INSN_MASK_FLQ			0x707f
> +#define INSN_MATCH_FSW			0x2027
> +#define INSN_MASK_FSW			0x707f
> +#define INSN_MATCH_FSD			0x3027
> +#define INSN_MASK_FSD			0x707f
> +#define INSN_MATCH_FSQ			0x4027
> +#define INSN_MASK_FSQ			0x707f
> +
> +#define INSN_MATCH_C_FLD		0x2000
> +#define INSN_MASK_C_FLD			0xe003
> +#define INSN_MATCH_C_FLW		0x6000
> +#define INSN_MASK_C_FLW			0xe003
> +#define INSN_MATCH_C_FSD		0xa000
> +#define INSN_MASK_C_FSD			0xe003
> +#define INSN_MATCH_C_FSW		0xe000
> +#define INSN_MASK_C_FSW			0xe003
> +#define INSN_MATCH_C_FLDSP		0x2002
> +#define INSN_MASK_C_FLDSP		0xe003
> +#define INSN_MATCH_C_FSDSP		0xa002
> +#define INSN_MASK_C_FSDSP		0xe003
> +#define INSN_MATCH_C_FLWSP		0x6002
> +#define INSN_MASK_C_FLWSP		0xe003
> +#define INSN_MATCH_C_FSWSP		0xe002
> +#define INSN_MASK_C_FSWSP		0xe003

nit: no need to tab the last two groups out an extra tab. Check alignment
with the GET_* macro group below too.

> +
> +#define INSN_16BIT_MASK		0x3
> +
> +#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
> +
> +#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)

nit: can remove the extra blank lines between these insn-len macros

> +
> +#define SHIFT_RIGHT(x, y)               \

     spaces instead of tabs here ^^

> +	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
> +
> +#define REG_MASK			\
> +	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
> +
> +#define REG_OFFSET(insn, pos)		\
> +	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
> +
> +#define REG_PTR(insn, pos, regs)	\
> +	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
> +
> +#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
> +#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
> +#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
> +#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
> +#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
> +#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
> +#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
> +#define IMM_I(insn)		((s32)(insn) >> 20)
> +#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
> +				 (s32)(((insn) >> 7) & 0x1f))
> +#define GET_PRECISION(insn) (((insn) >> 25) & 3)
> +#define GET_RM(insn) (((insn) >> 12) & 7)
> +#define PRECISION_S 0
> +#define PRECISION_D 1
> +
> +#define SH_RD			7
> +#define SH_RS1			15
> +#define SH_RS2			20
> +#define SH_RS2C			2
> +#define MASK_RX			0x1f
> +
> +#if defined(CONFIG_64BIT)
> +#define LOG_REGBYTES			3
> +#define XLEN				64
> +#else
> +#define LOG_REGBYTES			2
> +#define XLEN				32
> +#endif
> +#define REGBYTES			(1 << LOG_REGBYTES)
> +#define XLEN_MINUS_16			((XLEN) - 16)
> +
> +#define MASK_FUNCT3			0x7000
> +
> +#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
> +
>  #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
>  #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
>  #define RV_X(X, s, n) (((X) >> (s)) & ((1 << (n)) - 1))
> +#define RVC_LW_IMM(x)	((RV_X(x, 6, 1) << 2) | \
> +			 (RV_X(x, 10, 3) << 3) | \
> +			 (RV_X(x, 5, 1) << 6))
> +#define RVC_LD_IMM(x)	((RV_X(x, 10, 3) << 3) | \
> +			 (RV_X(x, 5, 2) << 6))
> +#define RVC_LWSP_IMM(x)	((RV_X(x, 4, 3) << 2) | \
> +			 (RV_X(x, 12, 1) << 5) | \
> +			 (RV_X(x, 2, 2) << 6))
> +#define RVC_LDSP_IMM(x)	((RV_X(x, 5, 2) << 3) | \
> +			 (RV_X(x, 12, 1) << 5) | \
> +			 (RV_X(x, 2, 3) << 6))
> +#define RVC_SWSP_IMM(x)	((RV_X(x, 9, 4) << 2) | \
> +			 (RV_X(x, 7, 2) << 6))
> +#define RVC_SDSP_IMM(x)	((RV_X(x, 10, 3) << 3) | \
> +			 (RV_X(x, 7, 3) << 6))
> +#define RVC_RS1S(insn)	(8 + RV_X(insn, SH_RD, 3))
> +#define RVC_RS2S(insn)	(8 + RV_X(insn, SH_RS2C, 3))
> +#define RVC_RS2(insn)	RV_X(insn, SH_RS2C, 5)

nit: should tab the above group out more

>  #define RV_X_mask(X, s, mask)  (((X) >> (s)) & (mask))
>  #define RVC_X(X, s, mask) RV_X_mask(X, s, mask)
>  
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 15e6a8f3d50b..1c3b76a67356 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -21,6 +21,7 @@
>  #include <linux/memblock.h>
>  #include <linux/vmalloc.h>
>  #include <asm/setup.h>
> +#include <asm/insn.h>
>  
>  int arch_kimage_file_post_load_cleanup(struct kimage *image)
>  {
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index fb2599d62752..0151f670cd46 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -17,141 +17,7 @@
>  #include <asm/hwprobe.h>
>  #include <asm/cpufeature.h>
>  #include <asm/vector.h>
> -
> -#define INSN_MATCH_LB			0x3
> -#define INSN_MASK_LB			0x707f
> -#define INSN_MATCH_LH			0x1003
> -#define INSN_MASK_LH			0x707f
> -#define INSN_MATCH_LW			0x2003
> -#define INSN_MASK_LW			0x707f
> -#define INSN_MATCH_LD			0x3003
> -#define INSN_MASK_LD			0x707f
> -#define INSN_MATCH_LBU			0x4003
> -#define INSN_MASK_LBU			0x707f
> -#define INSN_MATCH_LHU			0x5003
> -#define INSN_MASK_LHU			0x707f
> -#define INSN_MATCH_LWU			0x6003
> -#define INSN_MASK_LWU			0x707f
> -#define INSN_MATCH_SB			0x23
> -#define INSN_MASK_SB			0x707f
> -#define INSN_MATCH_SH			0x1023
> -#define INSN_MASK_SH			0x707f
> -#define INSN_MATCH_SW			0x2023
> -#define INSN_MASK_SW			0x707f
> -#define INSN_MATCH_SD			0x3023
> -#define INSN_MASK_SD			0x707f
> -
> -#define INSN_MATCH_FLW			0x2007
> -#define INSN_MASK_FLW			0x707f
> -#define INSN_MATCH_FLD			0x3007
> -#define INSN_MASK_FLD			0x707f
> -#define INSN_MATCH_FLQ			0x4007
> -#define INSN_MASK_FLQ			0x707f
> -#define INSN_MATCH_FSW			0x2027
> -#define INSN_MASK_FSW			0x707f
> -#define INSN_MATCH_FSD			0x3027
> -#define INSN_MASK_FSD			0x707f
> -#define INSN_MATCH_FSQ			0x4027
> -#define INSN_MASK_FSQ			0x707f
> -
> -#define INSN_MATCH_C_LD			0x6000
> -#define INSN_MASK_C_LD			0xe003
> -#define INSN_MATCH_C_SD			0xe000
> -#define INSN_MASK_C_SD			0xe003
> -#define INSN_MATCH_C_LW			0x4000
> -#define INSN_MASK_C_LW			0xe003
> -#define INSN_MATCH_C_SW			0xc000
> -#define INSN_MASK_C_SW			0xe003
> -#define INSN_MATCH_C_LDSP		0x6002
> -#define INSN_MASK_C_LDSP		0xe003
> -#define INSN_MATCH_C_SDSP		0xe002
> -#define INSN_MASK_C_SDSP		0xe003
> -#define INSN_MATCH_C_LWSP		0x4002
> -#define INSN_MASK_C_LWSP		0xe003
> -#define INSN_MATCH_C_SWSP		0xc002
> -#define INSN_MASK_C_SWSP		0xe003
> -
> -#define INSN_MATCH_C_FLD		0x2000
> -#define INSN_MASK_C_FLD			0xe003
> -#define INSN_MATCH_C_FLW		0x6000
> -#define INSN_MASK_C_FLW			0xe003
> -#define INSN_MATCH_C_FSD		0xa000
> -#define INSN_MASK_C_FSD			0xe003
> -#define INSN_MATCH_C_FSW		0xe000
> -#define INSN_MASK_C_FSW			0xe003
> -#define INSN_MATCH_C_FLDSP		0x2002
> -#define INSN_MASK_C_FLDSP		0xe003
> -#define INSN_MATCH_C_FSDSP		0xa002
> -#define INSN_MASK_C_FSDSP		0xe003
> -#define INSN_MATCH_C_FLWSP		0x6002
> -#define INSN_MASK_C_FLWSP		0xe003
> -#define INSN_MATCH_C_FSWSP		0xe002
> -#define INSN_MASK_C_FSWSP		0xe003
> -
> -#define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
> -
> -#if defined(CONFIG_64BIT)
> -#define LOG_REGBYTES			3
> -#define XLEN				64
> -#else
> -#define LOG_REGBYTES			2
> -#define XLEN				32
> -#endif
> -#define REGBYTES			(1 << LOG_REGBYTES)
> -#define XLEN_MINUS_16			((XLEN) - 16)
> -
> -#define SH_RD				7
> -#define SH_RS1				15
> -#define SH_RS2				20
> -#define SH_RS2C				2
> -
> -#define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
> -					 (RV_X(x, 10, 3) << 3) | \
> -					 (RV_X(x, 5, 1) << 6))
> -#define RVC_LD_IMM(x)			((RV_X(x, 10, 3) << 3) | \
> -					 (RV_X(x, 5, 2) << 6))
> -#define RVC_LWSP_IMM(x)			((RV_X(x, 4, 3) << 2) | \
> -					 (RV_X(x, 12, 1) << 5) | \
> -					 (RV_X(x, 2, 2) << 6))
> -#define RVC_LDSP_IMM(x)			((RV_X(x, 5, 2) << 3) | \
> -					 (RV_X(x, 12, 1) << 5) | \
> -					 (RV_X(x, 2, 3) << 6))
> -#define RVC_SWSP_IMM(x)			((RV_X(x, 9, 4) << 2) | \
> -					 (RV_X(x, 7, 2) << 6))
> -#define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
> -					 (RV_X(x, 7, 3) << 6))
> -#define RVC_RS1S(insn)			(8 + RV_X(insn, SH_RD, 3))
> -#define RVC_RS2S(insn)			(8 + RV_X(insn, SH_RS2C, 3))
> -#define RVC_RS2(insn)			RV_X(insn, SH_RS2C, 5)
> -
> -#define SHIFT_RIGHT(x, y)		\
> -	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
> -
> -#define REG_MASK			\
> -	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
> -
> -#define REG_OFFSET(insn, pos)		\
> -	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
> -
> -#define REG_PTR(insn, pos, regs)	\
> -	(ulong *)((ulong)(regs) + REG_OFFSET(insn, pos))
> -
> -#define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
> -#define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
> -#define GET_RS1S(insn, regs)		(*REG_PTR(RVC_RS1S(insn), 0, regs))
> -#define GET_RS2S(insn, regs)		(*REG_PTR(RVC_RS2S(insn), 0, regs))
> -#define GET_RS2C(insn, regs)		(*REG_PTR(insn, SH_RS2C, regs))
> -#define GET_SP(regs)			(*REG_PTR(2, 0, regs))
> -#define SET_RD(insn, regs, val)		(*REG_PTR(insn, SH_RD, regs) = (val))
> -#define IMM_I(insn)			((s32)(insn) >> 20)
> -#define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
> -					 (s32)(((insn) >> 7) & 0x1f))
> -#define MASK_FUNCT3			0x7000
> -
> -#define GET_PRECISION(insn) (((insn) >> 25) & 3)
> -#define GET_RM(insn) (((insn) >> 12) & 7)
> -#define PRECISION_S 0
> -#define PRECISION_D 1
> +#include <asm/insn.h>
>  
>  #ifdef CONFIG_FPU
>  
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index ba4813673f95..de1f96ea6225 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -8,132 +8,7 @@
>  #include <linux/kvm_host.h>
>  
>  #include <asm/cpufeature.h>
> -
> -#define INSN_OPCODE_MASK	0x007c
> -#define INSN_OPCODE_SHIFT	2
> -#define INSN_OPCODE_SYSTEM	28
> -
> -#define INSN_MASK_WFI		0xffffffff
> -#define INSN_MATCH_WFI		0x10500073
> -
> -#define INSN_MASK_WRS		0xffffffff
> -#define INSN_MATCH_WRS		0x00d00073
> -
> -#define INSN_MATCH_CSRRW	0x1073
> -#define INSN_MASK_CSRRW		0x707f
> -#define INSN_MATCH_CSRRS	0x2073
> -#define INSN_MASK_CSRRS		0x707f
> -#define INSN_MATCH_CSRRC	0x3073
> -#define INSN_MASK_CSRRC		0x707f
> -#define INSN_MATCH_CSRRWI	0x5073
> -#define INSN_MASK_CSRRWI	0x707f
> -#define INSN_MATCH_CSRRSI	0x6073
> -#define INSN_MASK_CSRRSI	0x707f
> -#define INSN_MATCH_CSRRCI	0x7073
> -#define INSN_MASK_CSRRCI	0x707f
> -
> -#define INSN_MATCH_LB		0x3
> -#define INSN_MASK_LB		0x707f
> -#define INSN_MATCH_LH		0x1003
> -#define INSN_MASK_LH		0x707f
> -#define INSN_MATCH_LW		0x2003
> -#define INSN_MASK_LW		0x707f
> -#define INSN_MATCH_LD		0x3003
> -#define INSN_MASK_LD		0x707f
> -#define INSN_MATCH_LBU		0x4003
> -#define INSN_MASK_LBU		0x707f
> -#define INSN_MATCH_LHU		0x5003
> -#define INSN_MASK_LHU		0x707f
> -#define INSN_MATCH_LWU		0x6003
> -#define INSN_MASK_LWU		0x707f
> -#define INSN_MATCH_SB		0x23
> -#define INSN_MASK_SB		0x707f
> -#define INSN_MATCH_SH		0x1023
> -#define INSN_MASK_SH		0x707f
> -#define INSN_MATCH_SW		0x2023
> -#define INSN_MASK_SW		0x707f
> -#define INSN_MATCH_SD		0x3023
> -#define INSN_MASK_SD		0x707f
> -
> -#define INSN_MATCH_C_LD		0x6000
> -#define INSN_MASK_C_LD		0xe003
> -#define INSN_MATCH_C_SD		0xe000
> -#define INSN_MASK_C_SD		0xe003
> -#define INSN_MATCH_C_LW		0x4000
> -#define INSN_MASK_C_LW		0xe003
> -#define INSN_MATCH_C_SW		0xc000
> -#define INSN_MASK_C_SW		0xe003
> -#define INSN_MATCH_C_LDSP	0x6002
> -#define INSN_MASK_C_LDSP	0xe003
> -#define INSN_MATCH_C_SDSP	0xe002
> -#define INSN_MASK_C_SDSP	0xe003
> -#define INSN_MATCH_C_LWSP	0x4002
> -#define INSN_MASK_C_LWSP	0xe003
> -#define INSN_MATCH_C_SWSP	0xc002
> -#define INSN_MASK_C_SWSP	0xe003
> -
> -#define INSN_16BIT_MASK		0x3
> -
> -#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
> -
> -#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
> -
> -#ifdef CONFIG_64BIT
> -#define LOG_REGBYTES		3
> -#else
> -#define LOG_REGBYTES		2
> -#endif
> -#define REGBYTES		(1 << LOG_REGBYTES)
> -
> -#define SH_RD			7
> -#define SH_RS1			15
> -#define SH_RS2			20
> -#define SH_RS2C			2
> -#define MASK_RX			0x1f
> -
> -#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
> -				 (RV_X(x, 10, 3) << 3) | \
> -				 (RV_X(x, 5, 1) << 6))
> -#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
> -				 (RV_X(x, 5, 2) << 6))
> -#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
> -				 (RV_X(x, 12, 1) << 5) | \
> -				 (RV_X(x, 2, 2) << 6))
> -#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
> -				 (RV_X(x, 12, 1) << 5) | \
> -				 (RV_X(x, 2, 3) << 6))
> -#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
> -				 (RV_X(x, 7, 2) << 6))
> -#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
> -				 (RV_X(x, 7, 3) << 6))
> -#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
> -#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
> -#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
> -
> -#define SHIFT_RIGHT(x, y)		\
> -	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
> -
> -#define REG_MASK			\
> -	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
> -
> -#define REG_OFFSET(insn, pos)		\
> -	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
> -
> -#define REG_PTR(insn, pos, regs)	\
> -	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
> -
> -#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
> -
> -#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
> -#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
> -#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
> -#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
> -#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
> -#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
> -#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
> -#define IMM_I(insn)		((s32)(insn) >> 20)
> -#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
> -				 (s32)(((insn) >> 7) & 0x1f))
> +#include <asm/insn.h>
>  
>  struct insn_func {
>  	unsigned long mask;
> -- 
> 2.39.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
