Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2BFCA0EF1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=au7Qwctr56MwgsM9kICzIuY364e4MJwSKklYjYpddRU=; b=qC4GWKMi0RqJf4
	EylUQ23v0aoXuBnhfH3V6fP8x7qOD2OR21bys5vopExfSZvipTgQAkhOX36OsiebUX09L/KU/i8JG
	jLfr51Ve4VZJ0fhm3U6OlvABEtG+cjOlSSdqrTwTcYsaBdSmTIil1Rh6P9lEizMai/RDA2XXJsXEg
	f2zuh15QrLza/4qCKVq4GgcXq3JPusLgZZQ1cAB+wHeo8sheAZ3r9UeucRIqIGGJm/ldIVpMPnr/g
	ZtTUCt4Ku3g+IoVQF7cZ+zyhDetB6lQmw5W/kokVWuZy4xibCHtnzRmradM24oHisFF3fMgITleD9
	hHcRuLJzqN+MEx4bKMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueV-00000006pck-0bw9;
	Mon, 18 Aug 2025 07:51:35 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unu2F-00000006lcV-2koP;
	Mon, 18 Aug 2025 07:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755501033;
	bh=DIyLi8TReoN+5AF3jvUXWckVHC2MAP2cCVjZaPo6GQw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=l9qdOH6SuVBnYSZj+wjxhn+mvv9XN/PmDpQhQAMuNdM5hmG0h5t3vvtwMW+1zoWG5
	 Yib/VO077FBPGrtxgZQPyc0aPqSc9Hg7cqAR8s/6fqWF1dNsmW1FIM10jju4bLs3pB
	 rQiiOdhiP/WuA3gsrbZXNFkjpoI5MoedclxU+OkU=
X-QQ-mid: esmtpsz16t1755501030t18f06d0f
X-QQ-Originating-IP: Yz02jh1oqjelU7qc2kAra1/3BSe5M9Cdk8a1P5ZaNVc=
Received: from = ( [14.123.254.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 15:10:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5468809535196601441
EX-QQ-RecipientCnt: 14
Date: Mon, 18 Aug 2025 15:10:28 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@linux.alibaba.com, guoren@kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH V2] RISC-V: KVM: Write hgatp register with valid mode bits
Message-ID: <BA652752F35145B4+aKLR5OHaYZ99CvHb@LT-Guozexi>
References: <20250818054207.21532-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818054207.21532-1-fangyu.yu@linux.alibaba.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NDvHpYI+rUKoCcvanv+jDIBUFssVCvhhKrpqbR+7d71n1kdyxCazB81I
	PHlJuKUylrJszCDad1ILvaNCUFiIFycmNKJeLgHrJ3/T3942SSn+hPbANl+/gj7uIkysQX5
	i7XAOijoLUmoncqVX3ypNJ4Repj0/fU9vTAXsgsatAEkFL51tyM4P+G2jqu1EZYpreD7lT4
	mbP05gp4FYOd1pJX2NaFGi/nskN5TtF9K9O8qDtQiYQTA59wpFQ+HCi1K6fX2tmiUDS5cpi
	sZCmj8Un/r3vs6YA9ihA1sdT8kLh7GubiDMCYSc4merQM+YHNQudWeiwduZn4rbafwpJpeq
	I2UmxCbKnTMEochv69bI+unWe1A/cgfwxSUnl7o45T1W7lo9JR3kPZj16TxitxT8WUBqAKP
	+WNiU9XuG1KwTOKzb8dseSbzxfrDvhr69qT4p3Zjr7h7SXYSjBqe44saX8Ws3+L8zm+D7Q3
	qP+0u3ioynRIbswDzhoCJF/4qxo1N5E6C/6Ti5e9+Y+m8etr9hLcAdf9pwmU5LkJKLc03YM
	w5O0yva8ya4pJ45mGGld4qqcJYP11Q6NvdnJt+RRpYr4n35wU4ZJa2QlVyW9cGqyp0ywEG6
	T/3zKHZmJgik7DtKIpxkK0Q25HwUAcfuJVls0yxzH2P3rXgwSGii0gK3WebDaH7uq/f/eES
	gjVl/wQc4mAdjE/ztMAPhKM7nQ5tK5o02q2vv7q6SrSDO1vPcKlTdKbmCBgv7rztyRG39Am
	Q0K8DVVtnheX92tKb46zJ//zUyo5a/qZM9ug//inn+L+OTaHNKm0Aw8WZUhuykZ1DK397Tk
	TssYToPQFE3g96+ij+pHU+DoHuUaoXz2/Jt3N4QwfyCm58ijr4FVCrvQANcv44hVRBnoqwF
	ynMckF6iRSqPuIBxmk2Wd+PKno5tXlFKX7+Y1oB1o7xPaBFv9VQWwGPDxz3q1aerqVij/Op
	/SYwPgTmXPFu+JeAjHsVw4EJBBIHR/1l9t8bLsBySQCSKWcqOxScfeVsKtWy57sMGyOyRTN
	tDXxHZhE0II6z7OBJCAq98IZ2mW8eU0WyAZO7OgmMZlzZiUK3Ec3KrmuMBzzrQpMzTDqI1n
	8TLsK/rdFHbtYnx4IwZUjgmocXt8WGrsw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_001204_083150_49AFDF33 
X-CRM114-Status: GOOD (  17.15  )
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

On Mon, Aug 18, 2025 at 01:42:07PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> According to the RISC-V Privileged Architecture Spec, when MODE=Bare
> is selected,software must write zero to the remaining fields of hgatp.
> 
> We have detected the valid mode supported by the HW before, So using a
> valid mode to detect how many vmid bits are supported.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
With Fixed tag, feel free to add:

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> ---
> Changes in v2:
> - Fixed build error since kvm_riscv_gstage_mode() has been modified.
> ---
>  arch/riscv/kvm/vmid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 3b426c800480..5f33625f4070 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -14,6 +14,7 @@
>  #include <linux/smp.h>
>  #include <linux/kvm_host.h>
>  #include <asm/csr.h>
> +#include <asm/kvm_mmu.h>
>  #include <asm/kvm_tlb.h>
>  #include <asm/kvm_vmid.h>
>  
> @@ -28,7 +29,7 @@ void __init kvm_riscv_gstage_vmid_detect(void)
>  
>  	/* Figure-out number of VMID bits in HW */
>  	old = csr_read(CSR_HGATP);
> -	csr_write(CSR_HGATP, old | HGATP_VMID);
> +	csr_write(CSR_HGATP, (kvm_riscv_gstage_mode << HGATP_MODE_SHIFT) | HGATP_VMID);
>  	vmid_bits = csr_read(CSR_HGATP);
>  	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
>  	vmid_bits = fls_long(vmid_bits);
> -- 
> 2.49.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
