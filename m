Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE0C43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdznaMC0kM6nridrIjwHnRUWUq2SCDNKsjubGdTHpbg=; b=KmVXJlIoXf50ki
	LMaJMhUpaKDwAMImNFzWuH29kxvhupxPvMdwJo46r5nn203X6zE/iHY/QDXSMmjoK+ElqNaDoK/rc
	tlHVPx+z75jA1ADwGekZyKs9TVcLls02TZOHbpaUAdSi4OcGTVnEDsijvrSVAqLdb/U9rHgJEn+ko
	TSSoA9GQNQCMekNKBhB+Mshke7gJ1Eu6QdQMNq5yPf8JwYUxWFnYYYH+pfctYkZaFSJnWpfrsw4Ub
	Aiicshw2lUVEDcDgYiW3vWa/LwwnbhFa6855NO9CxdfO4bO1MvibpbED5Et2iwFa5bqBSY7AYPYc6
	JhYhdQoVSo1qcj0YnJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxr-0000000BNTi-1NzN;
	Mon, 06 Jul 2026 02:21:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxo-0000000BNQA-0es1
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cac59f8b64so28977205ad.0
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304499; x=1783909299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=MhVbzElvJxm6o9XFnXpXDPr2BcM75stBHLMYkIWoU1TJMIX+///JU7NPVf4ZZ4mS57
         p37Fzv0CNYUoP/B3WmUjUZhcbevAzs8DHWnX9RoxtRxrXR9MQGdXPjuBTohbzOCw36XA
         oNDigELbK+5GXvsXpmstdVvxeJ77AKp+GDP9KVAhHSvnGe+tuTMrcDWxNle/w0OFHntb
         JPyibGtqEmp+dSbw8lxxrmko7hMwb1MJ9gDYZVG6aPGAH0rQIcvVEZhQ1xRw/nItH55g
         VnCAFlGFsWxNVu13if8W0vDLWnQ7L0RPsbG8+Wreb+0J6LNv2ry5YZwxaAM3GuHuwuoA
         Woiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304499; x=1783909299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=M2mK270jwh/ZAUsjqvAtfJ8vKu1EH1kYzSMmWad5R5IJZPrfXBqQjz56GjXiZLGBrR
         xLGXAmq88r+v60cUYc1IBJ/Ux/rH3IfNv9NB81wuap/QmSJeAM15GUwJVAQrwgNoSnte
         YN9CmONcLegnFc97ZHTUtv/EF8UJFPGOUqMZyf85NisK1jM/c7MaBPqzFJFngZlDyiml
         CM07t19+wvxr+8MbKNQonrwBafmX3sjHcxXKEMg/GroScW2NqUlVBjbbRETMCC8pS3Qw
         QqNFCDFAAf+zl+IFAbJNIRkY+7Am8O2jw4U4eMV7k6aTiuB25eKC7f3pYf/IlzHUkb1j
         am0g==
X-Forwarded-Encrypted: i=1; AHgh+RqpFn3Bwi7iLf2nlVWsDIYShPWsx5bmXiZFwVe1tsMxUILdyxpP7jkagLXX9XvtCzbi/SlR51FDATM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyopb+ea/7KozGCPYeN9x/8EiAyDHgDFVlU5FRsf+rJGpPpXBh8
	eQAj9IMXrBQr/0WZiF7PZNP6zPvW0VsTHXZaMUcNbEjiX37wtdjI/l/xPgs8wdxp
X-Gm-Gg: AfdE7cnf+sl3N/+rnutVUDElvuizZdB5B6GgiU6P23E5fuTR9Xw9fDvh+H6UE9V4Yky
	e6rRDC7k03aCBIVFU7HNHlTNO3V5bTq1inUZudzK2c9C/qO5J3Ty2Kfu9oy0zR4WvKXJNQSixVt
	s8nUJKoXRHvqV0Lw3hL1N27VU1NDGbvjTj8xcOp5p6BOoWgFvKdLidgkN0hbaVQl1nefdif+OhD
	h4kbPefd8dO3ELmHMj1HHvZnSU+TodWUEiFfmkOX8WE91O3n5Q7QPg1JKGIGlSfVscv2LunR0KJ
	F0/dCPFKHD8J0ffY5F4qEOyul/lH52DRnpDH2R/0Oo9b22GhFdc3mjCVT6Mgxx+pYYfVuD5EpaA
	xfYyKAI7F8MeAGAv4vigaDRxf4E2YvMZr+xsoqnTrjxdh7vVv00wj1Dd2AmVXKF92
X-Received: by 2002:a17:903:b8f:b0:2c9:bd20:866f with SMTP id d9443c01a7336-2cbb9f0371fmr85608345ad.45.1783304499269;
        Sun, 05 Jul 2026 19:21:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7126971sm39828005ad.18.2026.07.05.19.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Mon,  6 Jul 2026 10:20:39 +0800
Message-ID: <20260706022046.214956-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192140_906985_EAE0F703 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

Extend the KVM ISA extension array to allow KVM userspace to
detect and enable Zicfiss/Zicfilp extensions for Guest/VM.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/isa.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7bbea8812d92..a27de850fa4c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCLSD,
 	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZALASR,
+	KVM_RISCV_ISA_EXT_ZICFILP,
+	KVM_RISCV_ISA_EXT_ZICFISS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25..9852a91fdecc 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
+	KVM_ISA_EXT_ARR(ZICFILP),
+	KVM_ISA_EXT_ARR(ZICFISS),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
