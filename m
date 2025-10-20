Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC002CCD193
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fdbyh5zCAE/JZrNcgDdpNbI9GUE59ypZHciwtoMuf0I=; b=NaFNId6oUVVtou
	al5inHjecEo733F674sAOxtHbgyZDoYn0cOKptYjKEJ33OsSsaOWpfmERnyhPk1syRycNscScXM6j
	gzZFACnyc0lQMoOlvK6kUMBlOJDUAHIWCCA0hpszKnkiB8bpAswY8VDMjJYeGXmVfBOwMTl0f4/Vj
	yx1q3Z0ERxcA/cnkjevWmJbST7/AC+i2tpxndasgjKWABgc87wXPGkszKVs1zNvyPodPIBO1SdPk5
	RF6TQr13HWLypjiwKQW/MwNR7c3WPlVVyj4eL839Tbib1D/1p+K8Z2lVlZNdCo4QXoQe4X/hc0831
	XLTyY5FdhWojKbvrwslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhWJ-0000000BrSw-1Zu3;
	Mon, 20 Oct 2025 04:29:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhWH-0000000BrSV-2UkU
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:29:18 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b5579235200so2480542a12.3
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934557; x=1761539357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=jg6W5qEqtOdlvN/gpLi39gyCPrjTl5KiS+40Zr6cGdT5Gm3gspQBHSKc9V6y3o+ad4
         YgpR0/9GWOY5hPtT5qenll539l0ugIwi1c+z9rnkyVoihe37vj5eDGKCnPa9CB55k/Uv
         uFPZtXcDx5asHpIFQPHlrjgzGr1HAals10hokA6YeHLlYmKROAewGS7rI28W/1/ZP4PK
         zNfq3RNiifBE2DTqqr5wK/wdGIAdeqaKFs7QZM29RbUUg+ZcYOQop35mmYTvYax2SwHY
         ZHe3Q+Jc2gQAIhy/puk+mZWszI73JUhV76CUB4b0viUoYMXF3am8ElNRkbm7vw4lwxiK
         IZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934557; x=1761539357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=sCJIXuDSzDWFq2r+9cJ5PFJ3BstNl2T0umNy/oj9vy4vbXslWrOyP2UzOBo6s+av1f
         vwPwvv7oTehDwJBuAGm9A+E0PfFzUZx/y5/fxPuvoDyTXQzVsv3pKdcuN1D1VkCwv/uQ
         RhCfSsrFx9M3JgP6ray0bCU3Pzm0iDwvlNFblR8sF3YV3qiJ5GUal4RsgCji4hAJ8Ble
         BXDtgMAVIhtxJlIg0YGxSP9bB1GbN3IS1uSnFYKT8uDsAJh62Jo6Yo0v6ZXLsanpdoUG
         YFqJuoT3R8OiLnyieAfMPk7Kxd/hvIjbzukKG7yXlQY8APRv21UaDn/pXurT4ZqxMLZx
         eiQA==
X-Forwarded-Encrypted: i=1; AJvYcCWO3hVFjqf2YoILv1roMfNOj7n83jfnXm8/+EOTKOdu+mWip2LrA7B51y3K1Sqcp/BpdFrq6CuJusY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQiciwprwckXUgflswzddHPPMkiBMEqb5AsiAaqStRUZfokLRL
	/DAbtT6RNhC5I8OtJdxWG/ykQ7X1yNMBfMXVQ5uVZqzHgnuFwz+K0sdP4qsEPUsS9t8=
X-Gm-Gg: ASbGnctfiHlsW0Bp1NgZXL9F4iEp0SWHHDek9FFXZ0iV53Wxh0T9BjswWX9O/6VTADq
	YOTC+33fu7IXrkPkMS0nG588INALvzUZ+KUBZFw/x3/DnYiiK3YgTNPf6+iAqqO8wko7vSHnQ7p
	9pFVP2kkm0hbn85CbhIIHydKPxB3PshjXCumCv1xm1B66eLLrUtxrEYslaidtgTFaoLMpmStfqT
	FUVkTKJTBUpInv+rq1yhEAW8edKdmHD2rvmMlDW2IkflR+TVK8iU1bjsiU5ZYWa4UfDgbVT/mha
	faM88az1f3EruAV3kPhUkuLU5esz9yQ34SYg/MmXl8T8AgXIz/jLIvXCnBWMtmuCrUYKFRGQscu
	rmMkkPeBn2O5zIfSzIACm/Skwni7dWFrAt1MhDzj0t8yKRcxZgTTRdC/RnomTEkacy+Zs7ShN2u
	69sZBW/1PlQkGk/wHmBi+hjmy6EGkk31+7VMPYnDFYYdDjKB+D61gLUd7cyIa+4e8=
X-Google-Smtp-Source: AGHT+IFpyzb2lc+FEvYmYTlRzjGRaKAbU2/1KopbwUla+EaFbZIWmZ4VSEnrtlloLabkn4dzpBObsg==
X-Received: by 2002:a17:902:e5cf:b0:290:9576:d6ef with SMTP id d9443c01a7336-290cba423b1mr160239305ad.54.1760934556712;
        Sun, 19 Oct 2025 21:29:16 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b35dadsm6932872a12.26.2025.10.19.21.29.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:29:16 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 10/10] RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
Date: Mon, 20 Oct 2025 12:29:04 +0800
Message-ID: <20251020042904.32096-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212917_632648_5CFC7E55 
X-CRM114-Status: UNSURE (   7.52  )
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

The KVM RISC-V allows Zalasr extensions for Guest/VM so add these
extensions to get-reg-list test.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index a0b7dabb50406..3020e37f621ba 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -65,6 +65,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
@@ -517,6 +518,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
+		KVM_ISA_EXT_ARR(ZALASR),
 		KVM_ISA_EXT_ARR(ZALRSC),
 		KVM_ISA_EXT_ARR(ZAWRS),
 		KVM_ISA_EXT_ARR(ZBA),
@@ -1112,6 +1114,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zalasr, ZALASR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zalrsc, ZALRSC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
@@ -1187,6 +1190,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zabha,
 	&config_zacas,
 	&config_zalrsc,
+	&config_zalasr,
 	&config_zawrs,
 	&config_zba,
 	&config_zbb,
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
