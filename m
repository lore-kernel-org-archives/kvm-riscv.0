Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F55C021A4
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BJ2I4FBUFLLov3aFzCQa+b9RpgeYyc+lmqRVV3lwhw=; b=xkneT78Nlagjzo
	IAKk8f0U4kGBvVQVQlQOFvXvkjurNQ02Gg5BMyNpgok4MiNNiOG5iA2hFEV/VlGgoRlDDt+sf8GSS
	kVHtJiylX9tm/lkA6UezgeTbSh1cc66HcvcmSBUT8fSnFswx/cFG46brX3NmFY8v/ea1Es3tehrOW
	vABYoqewht80uLL0SmRnEfXJ0O6nr1XatkCpE7Q9iEEA+svZ3sgEJTalSLYw9BIhNvQOluS3jXqjH
	bb2bSGTm8LZftN6VMnQxIfzg9gQZ82SLaVAEQwtnVHBkPFe7MbaUJqnUyOpyNb/xpbifriS6v8qzV
	2BvBNklTawDctie08MiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkb-00000003nOE-3k6R;
	Mon, 17 Feb 2025 08:45:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkY-00000003nL8-0tUY
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso25856355e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781908; x=1740386708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GPsKALm7Yq13goem1fMBJYo69c+TVWg7YcZfawoJnY=;
        b=VxNRQfshyvf2wXPRJRxcQpHAObAci1U9WiG/Pfx6DvkgSjbl6qPAeBQyOrvka0O7vz
         C/d8slZ6i2BsVVkUqjDgczQ40Dp//kuBc+bx7XxLSrXwJzlUEzHv57yGQrJlo0LLwgEV
         pQWX8GmavRCvT5O7M4lnVGWDgWFIU3TXbRj/K2tuvkQZZZ4X0zdt/24T0gW4fy7/Tyuc
         QH6U45CoEkCRt182k2LZ/42nhf31nTPi0tSyi8p5rQHp3UjwVi9/BzULB4+H9j8cxpof
         0mJXBn1CgDloIFCUDj9VEwTPQ4U+yO7Ec9vedpWotI32q2C6cYd2WTO0G9tJVq89zlbi
         b5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781908; x=1740386708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GPsKALm7Yq13goem1fMBJYo69c+TVWg7YcZfawoJnY=;
        b=J73lxk7tkQzdt9ixkmMUm5h/+LIeUwZsGdszPFck7/r+sQT6d2pt/OYsHnSIw7IZEE
         Bhci8xSJSz1MFsIYR3l1gsWn4qPJKV2yYmXsvHQLKDkRJAP1soa1lkE1HUkc4PX+zMdy
         MMQYXqu/Yq8wHtmSdIN6SgrKIJRzKDywFrwNPJgaMjMNygIU+dSoxdtqMVttNWi8b0D/
         iOnzVKRjwzlpLw6z6/z2Fnz8x6kW1ebg0NBoTZJoMOE8LiSM9fNPct0tcY+24nuV3iSw
         e8y36pfxeZGGC0tVo6njL/SYXI6+bBO9AFBEJaxeC7tBGwFL5znt8eQkKijheeYmEN5M
         kYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWOWp3qzOBsxsy4iIckpqICB4ScHTKk5xb+7WIGOHKWMPUJgViQQz1hqLlYz40d8hzIS/GUz+ZGsM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7OeYa8xPngLUy3IHbjZf43pie20Z/OMANC3m+8hJzn1Awee56
	cg1i5o3zt7DqDpf4VIZhBVEHqiVeecZBSR/I16lgWWvzmWPvrwv/1dfa0RYZYQM=
X-Gm-Gg: ASbGnctCDSrSz52uFlH9B/gVM8jdH4F6FiBrd8OUF3UwQb2vu3wc5WMuQrP86W6fCG1
	qE04PfIt5cr1Vpqb29I1tSPuNR1NAVMowmrMHP3HJpY9NtxGP3BpAGk9tSdupfPJbeyVjsGMYvn
	2nFLpdxz5lE3u3OVhkmo9thciZjYNOeG6fVPN7suOCoQVZWGiMScmtvOixwCb7Nv1tS2XiRdE7h
	9fIHHBW18GhPGb697ExXnccjMiqJxtGWIFsf3t2tEY3wb9N41uVikPJ7C4GVj6HBFNjMU+lAq1K
	gbs=
X-Google-Smtp-Source: AGHT+IHp9BY0m/Q6kFaedN0UGWMC/ZwJ9KU/eUOLSaZCeTXH+n6PgSUFQ/UOHrMVcwrNPsAg/8wITQ==
X-Received: by 2002:a5d:47cf:0:b0:38f:38eb:fcff with SMTP id ffacd0b85a97d-38f38ebfe58mr5923816f8f.29.1739781908113;
        Mon, 17 Feb 2025 00:45:08 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f771dsm11482660f8f.81.2025.02.17.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:07 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 0/5] riscv: KVM: Fix a few SBI issues
Date: Mon, 17 Feb 2025 09:45:07 +0100
Message-ID: <20250217084506.18763-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004510_239881_D82C4164 
X-CRM114-Status: UNSURE (   5.50  )
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

Fix issues found with kvm-unit-tests[1], which is currently focused
on SBI.

[1] https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Andrew Jones (5):
  riscv: KVM: Fix hart suspend status check
  riscv: KVM: Fix hart suspend_type use
  riscv: KVM: Fix SBI IPI error generation
  riscv: KVM: Fix SBI TIME error generation
  riscv: KVM: Fix SBI sleep_type use

 arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 ++++++-----
 arch/riscv/kvm/vcpu_sbi_replace.c | 15 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_system.c  |  3 ++-
 3 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
