Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD15C87FCF
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75cp9oCA/lHhsMsEY39gVmHFg0e/AwX+9iVOrd14WzY=; b=s1OlguKkAMcpRb
	G7kDpNMdZvYwXmJjvtzq6LoWpy+aCziEXvX6I6UXRPkjZtxBMLFpuifLuBnFziZKD/C+ECjMAdUCX
	CYCqAoLiwIonyzqI0OuhPr2y2Ft90Oid70BqpgJ8dFIbvcg6weBrU4pjjtTzLXIMTuK1TQ6tOpenW
	g65FHXMopshrSLTOiuSSyxXZTcXBWDMteO2EaxsX4ThrHp8XWQuMa7mxhZxoTtC1g7fxRTV9uT0Lw
	2RRmuy2VkhtwA4HDaM2KWiBbf7yfqQC6qzzPnkcYDFP7vQOER1nxfhSTnpwyyFztZDD/L2yY631Ns
	SLuotywSZOR+tBCROeHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk26g-00000000vSv-34AJ;
	Thu, 07 Aug 2025 15:00:38 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk260-00000000uBU-2jDw;
	Thu, 07 Aug 2025 14:59:57 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-b427094abdeso1010176a12.3;
        Thu, 07 Aug 2025 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754578796; x=1755183596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22KKAv75ruk3Ey3Mnp1dAEnaFgvvgO6+9uK7rLi7Vnw=;
        b=Pdg1p5kpdVXxGxFrgm4ZiJJgRlDaVTBB53B3MvdH/5ESQG3tjt4rrKC0p8R63Edius
         TXcUGiTYizoVqz2yyNEJxLpk5+d/d7ouwvCi4V+MCFc4oiVpjvWMfrofuvV7CwbRzXB3
         gvZQaZx5XMcGA1o8awKxtL0zv7JtMTVo0f/k0050xl4hwqpJOJScS5yHIpDZzPhqX+Sk
         +RepBSMmFBVjbxECljPp365bxTQeEzQlwi5434C2U4vMYZBtg1bp8MjDlu6BtG0W0L8m
         cr1B2BoAPdlNHj1+0CEUbBt5X0ICzUfyZ93E7S36Kd4vUpFONZPTZLyYLlE1I/srtPyd
         B4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754578796; x=1755183596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22KKAv75ruk3Ey3Mnp1dAEnaFgvvgO6+9uK7rLi7Vnw=;
        b=MJPmsryYeUENPZ7O8rCPJ6txBIVrpdF143nVvhhQo1m1DJt3MLPQBhHrUNI4MmJfoG
         +X6Y/fmr4rAyVx0auLfGTxjswOqQwxSMArAJrDsykcyaRpR4auOOnUdOizl8JSmSrOCX
         YSBOV2LBq3DlVmuxjs7PMLXXbv5aUKDK/bOnJ1ADkgXkN4VBjZdRECiUw0CKTLrB9qH4
         xQzyYwNQ4Ns4UptriPf1lLkyeJZ4Fnz0bqf9APrjdFuUsy3BA0/m+0tVvdPRux/NpedS
         eWd2M9WW5wHhXQlQSgz1SPL4kxcviO+YFRq5WgGWu5ndE149vhLw7ip1vqzM05hKgRjA
         Kb2g==
X-Forwarded-Encrypted: i=1; AJvYcCVybXTAK+tRm1k1jC8HW4r3ltETKaF4Zk6HxV794DZCICNw+17jqNkJ3kWUn403f7AtkhsTAN68gJE=@lists.infradead.org, AJvYcCXmUghtL742zrpbaPCE+Kz6L/OKRqsnTNvpTB5dLnr195GrOFsdMglSBCCJPr7GH3pRlxiluow/QUVkO/k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqh2c6EzDbOF6ApAdEyQBWxXPCLyjADQhaQrqdEtebVWVuVgwZ
	myvhTAUrpv5h4HvIRKVpXs33jljK8idRYpMgbouYjOGCmfm5J8CCrMW+
X-Gm-Gg: ASbGncsiZQ45dfy/iEO8ASbcSrH8CHa7erCneTO1cuHsQxLoyY9EcfoYTBm15rqO3Ah
	YMWxIFMM5wZhHmkzj+bZ6uFFjhkHv7tVav/U976JxFjazEGfJ7oJLxdcY4JLR4BNpnC6sYeHaN9
	PVVjqiWZWxOhH51jthzCbDWS8hCHVq3shBnST3f/evGBV7hOUwTM5GokEyt9HJ8FIvoePdSl4O5
	m7uEnPGAT1eoc7iRIogYXjN9QZKF3kADUMaNjWXdpzG8gVZEk1QyTt2dXJgtkspkTpmaMXxEGdL
	wf8gsU/Nq6ytt8ftmJqIIAojWsvlan3J9lKF2umUX1tAkk9uCzfAS+zso5ZFz7pxkbr5QasIpLp
	+xAZNjP1OW3E2Ah3kKSR5zV8uFYQuXt3Xiw==
X-Google-Smtp-Source: AGHT+IHSOqYAlYjD5Ef/rlBHjxgWHAS+CS7TtAabCjgcNjOUQ2cMe6E5st467+N1r/2t8+OVaRydqA==
X-Received: by 2002:a17:903:3d0e:b0:242:1ccf:65df with SMTP id d9443c01a7336-2429f326a64mr84374645ad.13.1754578795747;
        Thu, 07 Aug 2025 07:59:55 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([213.130.142.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8977896sm188254875ad.79.2025.08.07.07.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 07:59:55 -0700 (PDT)
From: dayss1224@gmail.com
To: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Dong Yang <dayss1224@gmail.com>
Subject: [PATCH v2 2/3] KVM: riscv: selftests: Use the existing RISCV_FENCE macro in `rseq-riscv.h`
Date: Thu,  7 Aug 2025 22:59:29 +0800
Message-Id: <7de4aedb44be3166a6568c28da70c0d2d4850571.1754308799.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1754308799.git.dayss1224@gmail.com>
References: <cover.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_075956_687849_71824A9E 
X-CRM114-Status: UNSURE (   9.68  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

To avoid redefinition issues with RISCV_FENCE,
 directly reference the existing macro in `rseq-riscv.h`.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dong Yang <dayss1224@gmail.com>
---
 tools/testing/selftests/rseq/rseq-riscv.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index 67d544aaa..06c840e81 100644
--- a/tools/testing/selftests/rseq/rseq-riscv.h
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -8,6 +8,7 @@
  * exception when executed in all modes.
  */
 #include <endian.h>
+#include <asm/fence.h>
 
 #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
 #define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
@@ -24,8 +25,6 @@
 #define REG_L	__REG_SEL("ld ", "lw ")
 #define REG_S	__REG_SEL("sd ", "sw ")
 
-#define RISCV_FENCE(p, s) \
-	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
 #define rseq_smp_mb()	RISCV_FENCE(rw, rw)
 #define rseq_smp_rmb()	RISCV_FENCE(r, r)
 #define rseq_smp_wmb()	RISCV_FENCE(w, w)
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
