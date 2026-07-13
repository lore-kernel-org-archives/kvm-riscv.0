Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3DFC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdznaMC0kM6nridrIjwHnRUWUq2SCDNKsjubGdTHpbg=; b=swNX7ya4myvNfQ
	nte7FYVDxZpFyg5UDzwvHJVSfSR0AmWl1Xc5mm2l9oW+F4bG+F59rw7NqmMJS1mFDo8TUWYxKXqfk
	0TnNLDYaZjeEy8vpv/0vga/do03gmVRobUfjRAviwIHZ95eCS100MLavxK5YajZPMbGcwXH8NslKV
	QX4cVKzVrY8I1GKaMs/bqTIAt5YedPz7yIHIv4CqKqBCLfZqNrB8YuBWNM24ifZyQWlLMEki40iXg
	/oLsd0y/g7KEpE/fI5qRvsQr22mAKreQxU2Gd8iac7U+vNZSvoLi4BWAwhzNxTEKsFlc3Fse6a5J5
	5QK9eB336i59et+/UdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55T-00000007tZc-3l0e;
	Mon, 13 Jul 2026 01:03:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55R-00000007tXE-3ahv
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:03:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84a2c90e383so437842b3a.0
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904637; x=1784509437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=nqLAuox7bCBm3lmlcs7f2Lkpn1OauLQ8U5CFLt2uzCeZKplf5HwbSEiRNOkwlEL8Vh
         qu5xUQ4w7fW2LRQqO/r36JnVfA79BXeJU8hHEiKODH69CklXLdnxAXjs4PJ8Sdd2s/Mx
         IPeEJp8HTgh2hqZ2gf/VuCN3Ko743mXfdQUrbhWFhEn6zS3d26C+sQiyE13XH39OD+85
         1CMt5vVmlcYVSvfdWRwVfkMBb/IkfWVUJhdRNHJI4LIZeDJ+sAixC8gjLXdd7YIaH4tl
         irUohobEEIgB+C3B61e/ySXl61FRbgQcyxFuATdg7JaLQyCRtPxwvILDrhylqmoAQP9B
         IyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904637; x=1784509437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=g4fbzYUVWRO6bgxoM6jiMPTkvmpWdDvgWUdyltpBKK+WiRBPH5PAwhqCq+AS387Gjc
         /QrPhV2PYa1jpa8wHGhNKOs/Da8qyEvQwmstgzYawFhcmuF4KnG3wRpDDK5Txvm/UTmE
         VntKOAUC7VSnbR75AzXX6hYXJVQUx2k2iSKikR1O+ZSJ+5aqOLur0DNqj1BCAvdskvQy
         91fQEtGdWrtOdr+62hFu+tBP8pzFilNCBpACCiYquA5sUhaiwwZfNusBC4wDYQ1x127i
         CgQxsgdIVLJ5w/3pKreMn52pPKIEbJbiMq1n348hn+IpHWErqbMbvLysA/N4SAA5NNlC
         is6A==
X-Forwarded-Encrypted: i=1; AHgh+RqYO2S3XVHiNv6QPLkrlElpI6eINNwfZQQ/1zoSLCo1D5fDhrb8W4WUZ4JQPXqI1oGwcy3kIw7iZgY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLD5IUJsHacf+c6ixgUD4G1oCan3wxxYopN5P8lbUfpBdwIJes
	e+tfv7yP+GlRofAC1Q7qecSuKnhTE2jZDVUw6zJ9mIv97Uby6+XG+EWa
X-Gm-Gg: AfdE7cnHywuGep0JBrTwuE2PzF6xfTeUOI8j6T6/Ix9tfazS2v6rkMrH4DGU4339Kr9
	+vU+f1vTmk9++mu70QRAM+B+onesn9oZcRs49d0TRwRSyXSidBVxjEkZ0O40Xx7ZW/PxGNAG6EL
	r+NwyfPBDSWuZafq6Fxg32dXqFrghz6SUfku+G2XmEfe8Uv5S6FNuiGXr56nGQ6nfxzi/oysPVS
	vA3f/aZm4NMP9Py1f5SR8yHKwNe4Y92SsRfmuM4UsB2MK6xTqxY6PkniCvkEU8p1YxQJi6JPVDr
	+ddj5d9a1kUZFKB8C5Zz8GGbS/wYP7tMQ4iUN2lIUZ6zpIkf+KC0pgXHi04K7LK5FELBPXd+GQb
	lRrFGZj+JhrmYCMBsMDVsylxip9At86vVuH32zRnbX+vBalzIgV8J0L4rv2j0zfIA9bKJBqHS1Q
	0uLtcxTh8nipw=
X-Received: by 2002:a05:6a20:431c:b0:3c0:9acb:3fd with SMTP id adf61e73a8af0-3c112e0b020mr6533016637.34.1783904637089;
        Sun, 12 Jul 2026 18:03:57 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643cd6sm7790717a12.26.2026.07.12.18.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Mon, 13 Jul 2026 09:02:56 +0800
Message-ID: <20260713010302.303278-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180357_910059_ECDA1CDB 
X-CRM114-Status: UNSURE (   8.50  )
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
