Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924FBC531D0
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fnqkHJR41gqOqhx+j6I8PxkaWMD9QjTEqt94iKPkrOA=; b=BKuBa9Knt2qiFB
	obKkXrsha4C2rG6/xE/sWUnav0s3SQV4HTERAlCBVimt69KHyAeMdOzbfWqa/WpxCsFzqbx2u+8gv
	YMeXOSsVqt5DqxzLERxC9n1wYKFH+TZ46UyCQJd9oqJa08saGvgSMck7ZXJql1hc7Uly/28MhaOZV
	xu1f8iOJOWn5lNSoAB8J4uKsPtzkn9zmg6Ug+CZmxWGoVu2c79vKXWqTFxCvHdd1aVAbzth+umc+s
	ovXpbZuIqG+YPSO63CO1e4u/2e8rEiUtb/E4gQoj6NZXEpd13f8ltDXCoj1bwf3nG9cb1pWi7b0Hn
	2t1sT370j+4zLfbIewiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTU-00000002ht3-0erd;
	Mon, 27 Jul 2026 12:30:28 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTQ-00000002hrA-2P8V
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:30:26 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2ceb5a39c48so9234395ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155423; x=1785760223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZDUuhSz6sxGN/m5AK+s00UCMOMQBfNugawXzRdDcys=;
        b=oexyWWMQoQCSMIig0EHsL+CwQc+frScap4EX8Ijz72bWuZ4t5/Y9bmoXmlZxxrJ+El
         kMbgYGd8G0FaJqtCM+qEnmH3+/nxl4MkrQoSRqFc+TNebTbTwk8/L2uMJhzV+tkWxjhX
         0VHTSdtkefIhXng+PHJE/M2JaZpkCAJmZQr/McQVjZ8zI/Yw0tlV00yzfde+brtUsmer
         cIuF3tdbZP+SUNl2XruINgWYuadWCNOtFDTufZMNPFMb58ubKWc+S+6RirevePJclnvX
         6aDeRwFC4uB9UGWGskXwrH3xzXhak2dnxQ6ScMqBz94kHSUSq24fc3Kp8OjqpFZjJL2e
         Ud4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155423; x=1785760223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZDUuhSz6sxGN/m5AK+s00UCMOMQBfNugawXzRdDcys=;
        b=id8uNpShWHFKKMJEs9V2kTi97MScDJEPxuiVpQMZTi2OsRVEXJvR/s19c4JlTn4O13
         DUlR9X+Bp6MoBgrNgTxlddIozChxD8q5BLSrizBWGlTImV2opGiEEfsquIW8ws6GgPAV
         /LxRpd7co4fGD8aZNMjam2TL3SNmZgvIKj5G+7lMj2WOfAxnWizaJB0DveLiUK2QmC1O
         7r6ipc6JqSsaEVICN8VYKiF2Bg+CtWrbrM0M2zRVlxni42ES2ShmBGf0odNxKjp6mTyl
         iKkfPA1oQJIB5Iu1aE2aIDjB7xmBSotJ76lnTkQOuuG1iMpYGELGxKp0LlfoLMPY/uBP
         iTVA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5lyNoYsEzL5PQpg6W1C/A5BnlCNjyLWlLz7k/ee0g7E/4NUkY3zZD2rKlmyNVsSVzlU87muUSJeI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZM31stTYL5dx/w4acRAQYJXauFsGa5tVqcdmh3aGjckHnDecs
	jb5alV3pNGT3ipurWWHuDNwrESh9fvhMggKJ+70Q9fCje/xLEW9TkNfHPtaJlzQu5dN0sg==
X-Gm-Gg: AR+sD11c/HNf6w5V2BiAXshvN/HMeB+DuRxNnTUjh+HTs7JfA5Lh2qk/xEfBtZxxD5s
	Cx869C5dF+8wo6Q//N+Nq306aTYYj8QecgU1D9h5hZUzsV7+s5pRXAdouHNvl2A+8vBb5ZG+KVa
	MMlWAGm16Sb2ELGQIq8evwukFybp5skFRRaxT3UkCB3bvVRtDpamA2OhiDxOF7WB8myRCMtVT3L
	kiN/e8KZVpwq4ibpJ2F2Fc6zwj+wlGUIKWMUOX0r0olHp0rh21Zoq9U4HdRGSPfSOokwVBlTZJa
	IO7wlhEwLej5tCOi1uskq/qTZMdFFg1VhxRctZpttr8im/j2e+KMxJLk2MrJEkkITuUdhWDjCe5
	zYYZrE5xpDtNDb9PAZMY88RHrzzTfQ2RRVU69y3w1zI/ssEutTK3sciPvo/0hgvAljdpPPWuFj+
	P+3N1BWQ==
X-Received: by 2002:a17:903:2446:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2cfde8673a4mr76943665ad.40.1785155422902;
        Mon, 27 Jul 2026 05:30:22 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfe1ab9c71sm30679775ad.73.2026.07.27.05.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:30:22 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	anup@brainfault.org
Cc: alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH v2 0/3] riscv: ptdump: Refactor for KVM gstage ptdump support
Date: Mon, 27 Jul 2026 08:30:10 -0400
Message-Id: <20260727123013.118984-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053024_606916_FF45AD5E 
X-CRM114-Status: UNSURE (   8.08  )
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

This is v2 of the series to add KVM gstage ptdump support for RISC-V.

Changes from v1 (https://lore.kernel.org/linux-riscv/20260701085030.124579-1-fredwudi0305@gmail.com/):
  - Split patch 1 into two patches as requested by Paul Walmsley:
    * Patch 1/3: Create ptdump.h header, move declarations there,
                 and export note_page()
    * Patch 2/3: Make attribute parsing use per-level bits configuration,
                 and rename local pg_level[] to kernel_pg_levels[]
  - Added CONFIG_PTDUMP_GSTAGE_DEBUGFS Kconfig option
  - Replaced custom walk logic with ptdump_walk_pgd() reuse
  - Removed incorrect copyright headers from arch/riscv/kvm/ptdump.c
  - Fixed Makefile ordering (alphabetical, under conditional Kconfig)

Dylan.Wu (3):
  riscv: ptdump: Create ptdump.h and move declarations
  riscv: ptdump: Use per-level attribute bits for parsing
  KVM: riscv: Register ptdump with debugfs on guest creation

 arch/riscv/include/asm/ptdump.h |  42 +++++
 arch/riscv/kvm/Kconfig          |  15 ++
 arch/riscv/kvm/Makefile         |   1 +
 arch/riscv/kvm/ptdump.c         | 276 ++++++++++++++++++++++++++++++++
 arch/riscv/mm/ptdump.c          | 106 +++++-------
 5 files changed, 376 insertions(+), 64 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h
 create mode 100644 arch/riscv/kvm/ptdump.c

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
