Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63BBC5AD49
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2HEr/1SWdPmXqAyacY6/0pO2L94KxudgQG+WWRzPKnk=; b=w6CNSvsIZxc+v3+DxvM1F/33kE
	8AqvfK4PEb9X063JaDDlI51kn01TCx2yaXtlYtW5ErEfjNUyKsfkoUGu6uc9DQFvqqsY8DeHiTbqC
	oG3ltnbdd6XMBNslSxPbxCwOo5MN3RTB5xkhVnEJQaR06YOaaRez6oUMIvUWJz4y1OOOwgHoLto/w
	6vkw9ej7cNMSCS1hzkba+lPMA6UGAkoxCZokd26iytkQPLRp+araYZJGej5EmvHB75XH/QQVCW3pQ
	YH/1eEiZSp6KjfAtxAyCLe8GCBjZwZTGYdrvWREZ4Rj3dTQcRH+Pq/lktjFVpuW7slGrxU7sUHfhM
	Z3ABc+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhEF-00000001ApV-1vWG;
	Sat, 07 Jun 2025 00:16:07 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvW-000000019B6-3hwt
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7462aff55bfso2345991b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254206; x=1749859006; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VrOwB60iRPSms6H0AJKyXzUgvUqpPNkdC9MViEx8qm8=;
        b=OojWRQ6cDjSx8lZW57rR4gUNPMkcvNOEdsWZxDbKNTkEOHMwERBgfgECAN2AAlM4DO
         BuAFQmZOsonZjLyV/fDHKxOKlaefEYFxjXtw0QXCdRddQFXrs6SdkVvrMj2ywhrzY5MO
         q9o1gF8a9sqnu0vxsv4kFBnx3lWQi+BseAYEopCv5xKT59D4Bdza4PPy1ipZ4a5fjDtg
         4R90ElGKSKd5QqfhppG9OGUns/9K0fS/dHMezcen1T/u5f8YRSTqh7zWW3bOSvfWl44F
         R6p1NxgzptVHWpyXMyePe0ARHIzYNuMgSo7j0UL745dYeYn75qF3n58wtgdaj5MJ141T
         uiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254206; x=1749859006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrOwB60iRPSms6H0AJKyXzUgvUqpPNkdC9MViEx8qm8=;
        b=DFSWc3ieG0/fJS0EPekKu3CltqsxDmBvO5HYJbX9mMJo9l87e6rKMuidCjx3t8diLC
         KOE+URr3r6JbzUB7D13Dzv0PK2C/vpMfzA+nOb9+0Rgur86PWEXjK2rwnPnH6vPuHS1Z
         GiphsBJayiW9rqwjG6aC41Y0O0JJ+dqraT/0FAO7w1sRiqTcafMjsmhVWB2AR+ru3cZ6
         MN9eXhcJWg7uYeZhU8MkXv4hXztstAQAKGXo9kmjDftHKQxG5w2ssDLiL4mCPMqVtqlC
         14zZZ9z0DISd40AlGC6mVkrAMozZyYiTH8NeFbRKxDCr1suvJ06SQxtcVgr8MGBNKhTl
         biow==
X-Forwarded-Encrypted: i=1; AJvYcCXHP/72bp8IAfCVMM8ABX8qLEjyLoYIp7uyn2vJUhcC1TD1fnksgvIlmRGfTEj9obypojgO5Istj0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIAAL95PBh/GTPLmt5tKqmdoHTtoXu/+LlkP5CWbi5XHOTXHmH
	frFZSMa38GmtNryVVS/0cQe5BjOUpHGokGHl/pD+SPJGOvkaz4jOyBEPMWwmnsPTc5wGIgBc0w1
	udhu6PsrYSQ==
X-Google-Smtp-Source: AGHT+IGcO5eLR5D4rJUvqyhcG7DPzhqjWvwjT9S1GiHqHVEpWgfsWBe6SJIclWzcovJY/XCNJMaAI3VDhG0T
X-Received: from pfbhm22.prod.google.com ([2002:a05:6a00:6716:b0:746:2bf3:e5e8])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ad4:b0:742:aecc:c47c
 with SMTP id d2e1a72fcca58-74827fcd87cmr7087572b3a.7.1749254205891; Fri, 06
 Jun 2025 16:56:45 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:13 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-10-vipinsh@google.com>
Subject: [PATCH v2 09/15] KVM: selftests: Add a flag to print only sticky
 summary in the selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165646_921279_13F562C2 
X-CRM114-Status: UNSURE (   8.12  )
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

Add a commandline flag, --sticky-summary-only, which only let sticky
summary print to the terminal and all other outputs are suppressed.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/runner/__main__.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 4406d8e4847a..2dcac1f4d1c4 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -124,6 +124,11 @@ def cli():
                         help="Print only tests which didn't run."
                         )
 
+    parser.add_argument("--sticky-summary-only",
+                        action="store_true",
+                        default=False,
+                        help="Print only the summary status line.")
+
     return parser.parse_args()
 
 
@@ -131,6 +136,9 @@ def level_filters(args):
     # Levels added here will be printed by logger.
     levels = set()
 
+    if args.sticky_summary_only:
+        return levels
+
     if args.print_passed or args.print_passed_status or args.print_status:
         levels.add(SelftestStatus.PASSED)
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
