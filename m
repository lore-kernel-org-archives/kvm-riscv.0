Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29E3C531F9
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHjTTI8rrDhAFRW+Rp8ileUyo1j/LtgSBb+AInmlYHU=; b=CWahm51HZdhZtu
	B3MQy0VGpvaoljkcTusnAvXPJzcrhWL0uwJZxpUAnvZkgFvz9auNUsC/quKvmra+ooGWIYiSHoELK
	kRNuPwXf0IXQG7RpawsszBF/yR6edmUOruAULE+I2jYJPcITRs5aorGW7yhHb5JDT+54Jj5LJGkUV
	QwViyniWpgBmwvAkDrLgaQsTJsi6D5ezDPwxT6/8n2+9PSSpO4S+3f2f3FcgC2j96BT/sS17JtugI
	sJ/wWRHV+PZuHp5EE4oIaIQjGkHwQ5nXVODpjrkUM1hwCWU9tXQ3P61vS+RL1etJUzexX9DAN6Jnl
	KaDioQjqLbMbf7aDRagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokSe-00000005nLi-2atn;
	Tue, 28 Jul 2026 16:15:20 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokSc-00000005nL0-2hG5
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:15:19 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-383390e7584so1933a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jul 2026 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785255317; x=1785860117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvQY85JSs1DQ7oy04X11i3pK8UnfzkNAg8LAaOu6/1E=;
        b=aOwMte4/0dP6ej/ALKdtbru7xdqgNQE10yE///h19aS1axVZRHfsjMTI+jVYxQtZYd
         6dABeSLweGm7ZjkDKQDXp7N2U0LjIdmOCk666yzP9i2oMPZiiOwXsTSmFDtwL2w3bugB
         lphtM/dS9IZPYw9trhqaXFD1ZqUTurKTUSxUE3Ohoir9ucRRxWjA5iILv1rPxujO5jeC
         WMFBBdyu4mKwH1HOPubHt3Inb9z2b23YGXfWLLhojErK+fSMR9hBkoqzPG1cWxMuWF6x
         ym9naiUfgdiVAULlzYYxCHoSbP4gHEr0fGHhFvHlcpj/oazvXuyJrEuPcS2XyGg7oiUz
         1IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255317; x=1785860117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvQY85JSs1DQ7oy04X11i3pK8UnfzkNAg8LAaOu6/1E=;
        b=hgka+5G7IZDLsSR6QRKtB0J/95z0iAfjFntvmA6UVycwQKZePtHlMiyNQLee76tBd7
         X39xsSdVwXTy9vWCkg9Ew/FSzIoWWABKhGovihL+HNMW0Vf6PlcSO598nIm4imGJ1wJy
         UcJTdbGKKPm2SS6OLjcudLX7DMX0pmySb1Nteg0+uyg1gTe0csPoeDArbXdX3VSeYKq9
         WQ7+nLMssg5H1K8yihWEYE18mLV482NvB8BGYvRwB72gWmQsbPiiKAVtKC/ONV5L9iwV
         Uz4aj/XBRKL/4YOTN49akybisCUfATWI9PsQyrCuMYM3chHQhsrAYInRTcwKYDGCJ2sV
         8Hhw==
X-Forwarded-Encrypted: i=1; AHgh+RrmZGzOclHhYCnGKfihITN9ZQDVLyHMAZJWB76+vkZfRKeQsBoeUjeYiU/P1wnsW/DMIZBLM32jHvs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7XQ+LWEREQVBtep0moVaMPwSrk1v07OG5A555cN+igDIQYtU4
	dXKcChXJv6wRrUD/EauT2b3LiUtWDjnFZuaWPgAAdzoesHm+Ayap66QV
X-Gm-Gg: AR+sD10uXcZ5/qTBddsn5GFTZHL007zdWxNuf1IxAEa2I+k5R+pCUCv8TM+b5Lt4o3p
	+yywkF1MLATHKKuIOOQ3e8L/LSpRhOdC1VmnMf4uRSY7yDaHXxtiZMhflFfIYlG6fzYKxB6kwtK
	yeCIGaBCzOigvDWGH/jCpiArUcFAejTMiNmVMo2tRy/J1xZS4uLWzDndu/0Z3g/z+QCYlFwtkLi
	V8SztOW+tO33LbIsWwW41H7ZgxkusERwAnZ+hvebZ+tf61LBV9J+i6f/PaUP1dKE5CS0tWBgMBB
	Ejjd91IVojY0MSiqMYf+qh9j9bi1fqyY3YSae8/xYMXeWDiZJyIdiLWVGGYCnPJFZFDvGxfcuva
	tEc/XFFCpONHU9UB1RQ+V4NSUNaqKewA/2Y+S2eNWiZn/ukvduo0eVML8KTTg7vgWgRITtS4=
X-Received: by 2002:a17:90b:3c8a:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-38f6a24719fmr2890912a91.5.1785255316861;
        Tue, 28 Jul 2026 09:15:16 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292b06sm161141a91.10.2026.07.28.09.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:15:16 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: paul.walmsley@sifive.com,
	pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH v3 0/3] RISC-V KVM gstage page table dumper
Date: Tue, 28 Jul 2026 12:14:46 -0400
Message-Id: <20260728161449.190058-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
References: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_091518_682455_1136D606 
X-CRM114-Status: GOOD (  10.19  )
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

This series adds support for dumping RISC-V KVM gstage (second-stage)
page tables via debugfs, allowing inspection of the guest physical
address translation setup.

Changes since v2:
- Split the first patch into two as requested by Paul Walmsley:
  Patch 1 now only creates ptdump.h and moves declarations there
  with no functional changes (structures moved verbatim).
  Patch 2 handles the structure renames and per-level attribute
  bit parsing logic.

Patch 1: Create ptdump.h and move declarations
Patch 2: Use per-level attribute bits for parsing
Patch 3: Register gstage ptdump with debugfs on guest creation

Dylan.Wu (3):
  riscv: ptdump: Create ptdump.h and move declarations
  riscv: ptdump: Use per-level attribute bits for parsing
  KVM: riscv: Register ptdump with debugfs on guest creation

 arch/riscv/include/asm/ptdump.h |  43 ++++++++
 arch/riscv/kvm/Kconfig          |  12 +++
 arch/riscv/kvm/Makefile         |   1 +
 arch/riscv/kvm/ptdump.c         | 177 ++++++++++++++++++++++++++++++++
 arch/riscv/mm/ptdump.c          | 106 ++++++++-----------
 5 files changed, 275 insertions(+), 64 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h
 create mode 100644 arch/riscv/kvm/ptdump.c

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
