Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40F5CA0FF0
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex7YENyUoQjNN213go9KoUuJdZRZ+lDOs8rzLrq7sIM=; b=1XV1WRriIRGQc9
	lX4I7RNQ1RAShCsc47ZdLRt872dZYTvp2DoGJlbTdiCU2G7cDDg9woL3G1YnheJWJU2DTZrOAiwnB
	zW+jX8Jb4CaoTpdW5MTRwk9Et8qQp8amhAz/SuzkT5h2rY251mrzoXyozVuEt9n41PFh+76FO+SWV
	XRAHOE7/nEptOhj0vhTe4OWLj5aukdehHHRYii3DsquNLXwogWlpGegUuwp1sECEWSqpHXVlbT/38
	M9H9wOKoQOVlQQ0yTHIU2Pfq/7BjtHZX/7/83nRlDWiuEiv2XDZD5FagdKsN4CCHbvZ2+uXVmO7EN
	9eVtg7vRIqx52fKVBMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszU4-0000000BVxZ-2QlH;
	Mon, 01 Sep 2025 08:01:48 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz5F-0000000BSHm-0qST;
	Mon, 01 Sep 2025 07:36:10 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-24879ed7c17so30638315ad.1;
        Mon, 01 Sep 2025 00:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756712168; x=1757316968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkiDk4VN+vEmKndKCn5oB/XjLwcQPTcM/uTsBqiYe+s=;
        b=ktdeqBJXv+CY0Jou9I0rKAN9MfVC2ajHuk7rsopi8fmmbr0w2RCA69JHmVIKpODjVc
         ZYcfx4TL7uU+H/CtYAJnfjaDwoz+4S7n/dC4z7F75hyPf+kXzToBJB6SHjiLSD9yN4PX
         wg9Mn+YAZyL4kUaKQ+NTWom4ss2UJuga5/Ii5MjT+k2ck/yBGyY4UVPKO/YQKwM4Vf//
         IXOSh2f+0JLfZyfqLw0exN1gHlBJomnK7xMtGEGgmn4yY63GlQvG3I2LgwbxuHo0tY7U
         rHnLgvdPpnNj6mW0LUK6yMV9d1muwFYjlrIFkLJrpAmgGH1D3by2c4KN1ERnOKZZK1zH
         QOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712168; x=1757316968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkiDk4VN+vEmKndKCn5oB/XjLwcQPTcM/uTsBqiYe+s=;
        b=dlk9NeOtGlsj9xSMDI0+JIiyqe2piQiF1W+wXh/2hByRwr1+rUgykisjxzN/H1bY4R
         JrAyPtdOUlZrTT5qvYJQLTr+4b7PtmRjMsyW8l5Due2UPybfnFaQapIFpXauU7rADTba
         a3JL/XBb/ZpDQ+HJ/YBVECB/BytTBqHudpGSNef+O0bdZIpBr6E8KF6ik8HMns2RaBKt
         B4BDYrI/1J+jSgTlTZYkGq/nBAKWMdg7gS3T67SLBOLjVNwniRPqp/dyUVAMapiYM9CH
         PhCmzZluu4jC1c8crx5H0XmVjxWi7yiJw6SyHqP4UPqI/1fHIx5tSuKFAJhpb2iAsN49
         VdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Agf6E3eEXv+rKBAiwkahy6/cTA7hZEnk1Rua4HK97Qlw0IzJjv663tCCHmcFD7+k5RUBlRlUrYU=@lists.infradead.org, AJvYcCXsbpBbzcXVF0AISPs5c+/q0srFpJ2irAmnr/5QIX+x6D9RwET5Kqqi4990JXirmVlK2h1paGFgheEA1V8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ5CGck0Y1K5JUR233OOmuXTia3RThngWuwOwRjs8s00UIcSgK
	VyyYxGLTRiEyCRjFSBc5tTNyyJG+QTs08nHiWrPkhR80nyq8W3MmS5X1
X-Gm-Gg: ASbGnct00eg34oWino9CHYEKgkxeLntjdZ4TOWV6/2cYkQj6+PNVcO2KQoPzjkVVzou
	aU6/+ICsplD2IbRsw4tnlmmuXKg1jCO5M6Dh10grkN7pX8JY73JG+hkRp/TRnV4y87WYyI9H635
	0zxAO3so0rrDpyrmskvKJLWxzOKvkA/eQvLq+V7JeX4V7OYz9u4IQYq7DHhqlYXcvEqg/IwgwLX
	fUA4hmug9RbOqypjMDVe1vN3oFMEPKYZPRIgKNoUTdJJodvVwqFQMdSOs8kDHjD3o4kh+WS0h+P
	pR4OXYHEMDj3qgltnWAT0k+FyZt6kcZvEIvx1wJyRkgMsUIBTFthfsFuebplUJrmUPgCdqofgT4
	e13evEpqMjFKveJ3KOblu
X-Google-Smtp-Source: AGHT+IE0fxda67lxyd5c0ekaSqZeGDPb708pPB9HUQ+wDEYZYnJ70slNseJr2MZAIOPmzUcG3kkICA==
X-Received: by 2002:a17:903:2f8a:b0:24a:e25d:c704 with SMTP id d9443c01a7336-24ae25dc9a2mr14677165ad.47.1756712168294;
        Mon, 01 Sep 2025 00:36:08 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([2406:8dc0:6008:46::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903737b05sm95867045ad.49.2025.09.01.00.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:36:07 -0700 (PDT)
From: dayss1224@gmail.com
To: pbonzini@redhat.com,
	shuah@kernel.org,
	anup@brainfault.org
Cc: atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Dong Yang <dayss1224@gmail.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 1/3] KVM: riscv: selftests: Use the existing RISCV_FENCE macro in `rseq-riscv.h`
Date: Mon,  1 Sep 2025 15:35:49 +0800
Message-Id: <85e5e51757c9289ca463fbc4ba6d22f9c9db791b.1756710918.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756710918.git.dayss1224@gmail.com>
References: <cover.1756710918.git.dayss1224@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_003609_241121_D496F7A6 
X-CRM114-Status: UNSURE (   9.52  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/rseq/rseq-riscv.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index 67d544aaa9a3..06c840e81c8b 100644
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
