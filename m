Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9B1CA0FF0
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8WfFC5/4SpkfF3xerT6f9kVgpENCVgBAHSLnjJFtIuY=; b=3e3KLTPYvMUAtd
	STZxxLTJGcJPWxCoVgoKEcXlhho+TzBJAq1B24JxS+NwziYJPzrw274yQgvsqtwFBG9yxLeZaZtHU
	2ZQ52tloKLgBPI+3YAFGQpg2R+CqpRGSLc4B1VV9TakneaGWmle2vao6iOwTZVkQZcgF4EIlfZlVv
	p3+jI6+U2SWv37WnA0noovJEy9YrxkLMenYHCxcRPVnMHJWWix1fmeJzxkJf7CKx8fGD8Yk7mRpzA
	sFavwgzkuyhYGkwMjFYjR/NPixdWcEbldbLSktjs2Slvz4yIA6E9Upg/XA8hl/nKq1X66XnPFrV8C
	QLufTERnV9xaR15wfoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszU0-0000000BVvf-3BcS;
	Mon, 01 Sep 2025 08:01:44 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz58-0000000BSHE-3omO;
	Mon, 01 Sep 2025 07:36:03 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2445826fd9dso49031965ad.3;
        Mon, 01 Sep 2025 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756712161; x=1757316961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L0ePC0WzColXkaFbBrk+Z/IecQrL5Wt4AmBIdBx+2Qg=;
        b=DaiW8EXkyFByZhVcthX1D8Lg2t3Ko8gaBs6Bz7txOLBYdylFqA/W8z+uzjYjzJ4hxH
         who45lb/EQs84SxWTgDrjle9rcRTx2waw19KDopQmYo4RoN4JSMv5szKewXMcE/9qB7y
         S9WUUe4WCLKCTfIbqEeXCjIkX6OkAvzQAZm+FpEVI85CXIN212rIFXr2Rk7RAT+H9TfG
         CuG+cMMglwLmGQ8Bq+5/IiAu8rasTBs4prXUMYipM6CtlwDfEn/vmKFoOStvq67128DU
         aUwO1FuoM6BA9AoNIdLoVun4d1cGX9orfPcH4RooaoWq19Nq5RznPcB1hpq5tu7mqiSt
         MzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712161; x=1757316961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0ePC0WzColXkaFbBrk+Z/IecQrL5Wt4AmBIdBx+2Qg=;
        b=HEmJpvj/9gHWMJtm+81qPdyZRPS7sT3B/56ogFnDVJdtAmzVxSdz7fQzgBTkX02qaC
         X0voTqS3crpUaj3WviBcrh7Z4VlfshSC69M4lbGIspXp1aYDs+happf2BMJqgY6EqwZz
         TzanOYjKSlIqeBkQ9tsmKdq8NmBeVcgJHSdVvLanF+6T7t5zyFdTAgEEgyn9027GmsqB
         wMheZ2U5cppgOhNhEwweHgKN9uBByd7RzMgd4EnloLJxcgIU3e5BQhJdXELib6SZJBKd
         H4A0L1bAQ3v88bsmFiBYChCcm3JliF1I1oBt+lzdbZrUHUimMdSz2Ft6cUSOkJqrH9Ri
         6n6g==
X-Forwarded-Encrypted: i=1; AJvYcCXRcSORURwze9k2iepfvO9gctfSSlXr+mUfenouaRQQPNPusW/4JF70S9QpCk/UZX30cN6kYyRTxtw=@lists.infradead.org, AJvYcCXa/ThTms8TCLGbB/7oENSFhHqT7ThHRkV08KBduNQ6jYGIjGwlTAQ5iQZ2xIVbUfb1UliPQD1X+pFxXKQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfetwf/Yrcvf27jeK+eSpCrLfpPudjRsCME7jTvJChtYeu41/R
	SYW4nSoWGCVccZxcN0bvUvbemlyx0AsEdD8ROvR4k/9MZjA0RU78GswA
X-Gm-Gg: ASbGncvv8PcIeq/gkfejXLfOt9b1htiOD4pXFwIl5Rjymah1a6rEwlgsaxNteMFqQTH
	8bSzqL8LknNPgVzGKJSxQImm5trVxxBtfhaOGGNH5KPhQaWJENzBvwfH3B6XahaQSNp6JXm8JNj
	uDqT9Y4Wo8xDz97KWugzUv56ZOsLXOYlRzAQmmvhoCa2Dn5e7RjXJsB8pikS3pdhLrMNRU/NHij
	MhW2HyJKhllTUyezqMn+XAOWRDYp05ISGkLKAfeRrSWKv8DlKxqOhVisJySe7udQ3M20lxRzDDt
	OWy3UtyFFT3QT8dnm6kOKJMxClBUu15VqkoYRbQ2HoygCp72sXuwGlrlpO7rFovIKg6L8cl5AVL
	95gixH3B31Jg2BL6PVfs9yOalzfZSxQw=
X-Google-Smtp-Source: AGHT+IHCC7OUu97GWMAOQYi+hndVB3qfPEyGEt/pCflpkaED9w8c03pQ0ntMhKZbeOTUw6gDQtgfvw==
X-Received: by 2002:a17:903:2c06:b0:246:cfc5:1b61 with SMTP id d9443c01a7336-24944b15b97mr87894275ad.55.1756712161144;
        Mon, 01 Sep 2025 00:36:01 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([2406:8dc0:6008:46::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903737b05sm95867045ad.49.2025.09.01.00.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:36:00 -0700 (PDT)
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
	Dong Yang <dayss1224@gmail.com>
Subject: [PATCH v3 0/3] KVM: riscv: selftests: Enable supported test cases
Date: Mon,  1 Sep 2025 15:35:48 +0800
Message-Id: <cover.1756710918.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_003602_948771_1B5CD68C 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Dong Yang <dayss1224@gmail.com>

Add supported KVM test cases and fix the compilation dependencies.
---
Changes in v3:
- Reorder patches to fix build dependencies
- Sort common supported test cases alphabetically
- Move ucall_common.h include from common header to specific source files

Changes in v2:
- Delete some repeat KVM test cases on riscv
- Add missing headers to fix the build for new RISC-V KVM selftests

Dong Yang (1):
  KVM: riscv: selftests: Add missing headers for new testcases

Quan Zhou (2):
  KVM: riscv: selftests: Use the existing RISCV_FENCE macro in
    `rseq-riscv.h`
  KVM: riscv: selftests: Add common supported test cases

 tools/testing/selftests/kvm/Makefile.kvm                    | 6 ++++++
 tools/testing/selftests/kvm/access_tracking_perf_test.c     | 1 +
 tools/testing/selftests/kvm/include/riscv/processor.h       | 1 +
 .../selftests/kvm/memslot_modification_stress_test.c        | 1 +
 tools/testing/selftests/kvm/memslot_perf_test.c             | 1 +
 tools/testing/selftests/rseq/rseq-riscv.h                   | 3 +--
 6 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
