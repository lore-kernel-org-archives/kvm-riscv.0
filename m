Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90798CA5FFC
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 23:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/40Pfv6g6yrdBuAXS7UwiCKObvSfJeoR5z9uhaUx8Rk=; b=N7c+WIrSCVEqSY
	oB7UzR+4JB0oH+ZIZY4Liwc9ICuCiB3LbYj4Xleaz/3i8ebf0ke1SuYB+BLxtajdnsjo26oQybYRI
	/P0V2d1TLoCNsaaZHTuJsCbu8C504A3PS2rlhcJXqRlQ/KHaMh7sqUL2yigfpXJoZYIZoEfXVYme/
	QYQRK1TQbK9QkeFifkm96+iKqOLSd3JdA6nNXXOE/EuSUQOmzFCt6oig3HqxtOzkFzoACnnEOneKx
	7/C+k27euGInsrTPYPE9AuJ8L4RiereItpPjADYKqzs2yNh3M8uH/VPWWo3kJnAafCRq2tntQ1Kqs
	nynNlbkovFuE1RhAq2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEnQ-00000001VM6-0tC4;
	Tue, 06 Oct 2026 23:42:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEnN-00000001VLL-123D
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 23:42:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so21099575e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 06 Oct 2026 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330123; x=1791934923; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xtl9xeh/w1n1/842SeGkR83P1qgAjaMld+9slL7tN5Y=;
        b=G/Cw6Zf5cPHLMM2k6oGJomsKuGl8z7pgcizWdHbfYUEfhUIaLmz8EquZvSs34wvhtf
         IZFjEbMIUH6ThTZDkAVXNaZMQoDyHlHHkdhm3la78Bi043+SOme94RTbT2UZxuxGCswg
         PbvjGEF8+gjfgpAtQ9NfibIFn5K8GADAC56m7LCFWl8dRmlkBfoRU24dChTGf3Ow6rMI
         KK52FBS04Uro1nrdex4JkaLzHgNYOU7/mbfX0H7Er3pE0Y07Hd/AuFJteTyqhIRqGyxk
         tDfIHRIUzt0IN1U032aOZiwX9koRXx02eTcmn5P6iaLstVNe+UyDR3BAlJgYae8TsNY0
         4/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330123; x=1791934923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtl9xeh/w1n1/842SeGkR83P1qgAjaMld+9slL7tN5Y=;
        b=rbzpmtx75wWR1ILS9SACy9A3K1zevpWDwYsriIcqUbV5QQMdBBGrgH+3e9sbqQWO9o
         AUktXR6aJbYKOTXkr2qtMTk7bwgkaNGTXHkBpXgjbG9Z642f6i2eNBtTaxKZC/c7xqaQ
         +5afMiqJy5oghSssCazXETprufo0o5oFt4VvJ4UOQGR29E56MMQref15zSn+gYuU1Nqp
         ZqCwMSBP2/fKl5jibb7ewDxMspMwRUZsafGbFctb5KiiCRRJkNJfMZEKpp+w23QntO6O
         pYrMRDxzE1Ocz69/bq5m9uK7UnlceFd8H5O7NuWgUL2A6xTr8EuAn1nVjnmNjpzarnM8
         paHg==
X-Forwarded-Encrypted: i=1; AKwUvBwlJOgIXOAKukWn/EJYopN9VRWm4EzOeyx8yUvP3qlHZqYFmpM7LD5uysZwRd46c9UdOeF77akGy2o=@lists.infradead.org
X-Gm-Message-State: AFuF++n/I+tJk3mqN5uT8QIkWmzBe7ki5p3/tehcF4NhFn1Mdu49L+Ag
	K96+w2cwvW0Z23fEVT4VNyRHiVHG/uIZ01nGvTpfATmi26IPmX6vNJ1gNucX16YI
X-Gm-Gg: AYBFou1S4n0Okn5oJwykIMMb1rdvh0sWIXCPbarCn3flHea+PIY46aran3jZ3PMGGfY
	uPhg4X5hSE77Gjlffa4I0CGYLeSd+EDS6lmJlZEj19x6/0DVA+urXi5OMaReM2yt3OmCmMnvkbk
	3s3/xTECFmFTo6zUUGv2ycFby04pvh2jQ/QFGaJikQY3oytPLlU0oWirDhuSvPPjojG7/359p+Y
	7cnnNsRoG3cxIMFo82qtDeDiPrfe/kWGBeHbJzLA1dSIedUJshROY5taR2SlTu9zimN/ypvsRvT
	qcTVC1Ucxj79tbw6MSa37a9mS/phncYdCUuTEM0Y7UX1quayO3aB3yFpJbRdVcAvmuQD7roSzvY
	ojNCyZi97ZUZT5jwx1K7xujZpyv88Qgx9BqIf09s5w+Zn33sXi9wtLvbi5MPCIeCqsn/AZGCS69
	x4Pd4LX5BDur4VXr5QCqnoAWcueg9in5rQFaUvyKznzfOVRBbFg2OaDZHAhI8t7Ry8Vt0e0RqfH
	h8J8iPr+7RzbLJJB9jgJWac6g6s0AI=
X-Received: by 2002:a05:600c:1e17:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a180310dc1mr5435555e9.14.1791330123255;
        Tue, 06 Oct 2026 16:42:03 -0700 (PDT)
Received: from blinky ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53997sm153565635e9.12.2026.10.06.16.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:42:02 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:42:01 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Andy Chiu <tchiu@tenstorrent.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: KVM: Fix compilation when CONFIG_RISCV_ISA_V=n
Message-ID: <asWHSd31uyyNvt0a@blinky>
References: <20261006-vector_off_fix-v1-1-9e48e654d445@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006-vector_off_fix-v1-1-9e48e654d445@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_164205_314482_54064D12 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, Oct 06, 2026 at 04:39:03PM -0700, Charlie Jenkins wrote:
> Fix the KVM code to use stubbed out versions of vector functions when
> vector is not enabled instead of failing to compile. An alternative
> approach would be to ifdef out the vector code but since a handful of
> the vector code already just uses stubbed functions to tell the compiler
> to drop the implementation, follow the same pattern.
> 
> Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Should have looked at the lists first, this wa already sent
https://lore.kernel.org/all/20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com/.

> ---
> I was reviewing [1] and noticed that when I disabled FPU and tried to
> compile that vector got disabled and the kernel failed to compile.
> 
> [1] https://lore.kernel.org/all/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/
> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
> index 6371d5ea5392..1c9efc6048bb 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -11,9 +11,9 @@
>  #define __KVM_VCPU_RISCV_VECTOR_H
>  
>  #include <linux/types.h>
> +#include <asm/vector.h>
>  
>  #ifdef CONFIG_RISCV_ISA_V
> -#include <asm/vector.h>
>  #include <asm/kvm_host.h>
>  
>  static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
> @@ -55,6 +55,14 @@ static inline void kvm_riscv_v_exit(void)
>  
>  struct kvm_cpu_context;
>  
> +static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
> +{
> +}
> +
> +static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
> +{
> +}
> +
>  static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>  {
>  }
> 
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261006-vector_off_fix-938d61b1f906
> 
> Best regards,
> --  
> - Charlie
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
