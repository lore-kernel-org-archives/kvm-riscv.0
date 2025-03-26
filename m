Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF3FC36008
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LKvG43oYW32TbZaWBX0X7ArOC+e7M5Yp65XRjd5sXas=; b=o9cPCxADy6HwPN
	tvmpNx0Rs8HN8IVzSkspLJzy1OHRMpUpScp9XovTdpJbWGgb8Tje+wNyoXPV35Egs9F0SFoxPaQFf
	MpP3pvRF4NKwCfAaL21JFJ8ZpJuC9iM0R9AtcuTgUY+0EbzHqFDu5RT7Vh8mNbukuv47ktcuip5lZ
	XjXzgzwzMDJUqyv6aRA2aznSUo2ofbFDZ71tnsKUafxThgylrzuNKBIwbTGxpNi3P9RPROJej3al3
	XrsHHQ9Wv6vdSgchVC69tx/ZvAr7oN7iI6ESACmxEfJvSNWM65+qAy6XcA3jSB4qWWam4TS7DMgG0
	4lWx5WOgGYsff1LpaBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKiZ-00000007iMM-0SOz;
	Wed, 26 Mar 2025 06:58:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKh7-00000007hwq-1ITw
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:56:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22423adf751so121685515ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972216; x=1743577016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sfmrNsfpk3u7jxX/pak7OLdb/sRu187l8xujoBmYZpc=;
        b=mb8YoNz8WRUaytGmc8KyWd9A5cQydnmh6iaZA3giBwYH2+XVFx/w2Cr6IarCZ0lf16
         VHhk7vB6S/Ju/9aNAj/ZuCdEvfYk2G9VciSJA/xeYtotnUl9NyryadmYjUyIlLubG8Sf
         p7eaWEg1yrEcfKbDA2Pd8A7nlof24eO1SZ8meGnt53qYTdCIYxb4/rC5wd2wUNbJLCYz
         dfII3+gXZgrH8tfKdZN1JbmjQ6jDb8sCg1Yjae3QC9gRnUkdfjdR67wMeMOYJry5GQln
         3xnTU8eXqyIB2DwU3AAmX6fxuutxUUxTLqfmSKX+85UZVmEMiYGvbtw6ZObklwuHflkL
         YY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972216; x=1743577016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfmrNsfpk3u7jxX/pak7OLdb/sRu187l8xujoBmYZpc=;
        b=kaIGbZA/ike7c2SgxVyuorGXKAfYFze4F6Lpz350UE9kUmhPDDPzUxjdyRaD8pi3JJ
         8n2iDOTspwzlTZ8vY/Cxke9VswXmN2spRthVg+0q/mMYDiCi5n1uBZqWNNH7phm1lV+s
         VW+2UxhsJKurmW2xm9HoFwBLZRQ2XOpLfiYog9OMw62PO5El8bHZ3rtA5D2q+9NqW9Mn
         9raFFNSCo891mP2Y0labFJCMbrBp4/HgCfGbVAO7pa99Ynn1BFRwaEEjQcLLTYX0M6WE
         /raUI3cUNxBrElhjxh1BX2v4JL9G248LaIFXp6uO3YKpzmTEdx3OkIEh4MftPfn8kGwu
         bdAw==
X-Forwarded-Encrypted: i=1; AJvYcCVl8DFxNkWR0sDnZHBpdg8VoTnfO4g2diqFnReMC60PGz/6RJsLsxf7+rzJXo/ZhHYqVyaSjQ7E/sc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTt4RMay4TAfwBkKkrlOZTuMYtwGeW0PxjqF5SNLe+Tca6ifYT
	n+wb6cjFXDSHJj5hPGOpEoVUeuJU429+nhAtYG2h8qQ9qtLTrhcDvMdU1vnf6P0=
X-Gm-Gg: ASbGncsnlVDoxY6vjHFsWFoVYdgSrUyVGO7MI+HUT+CXSRBcIr7Ee+DmVtMseSpQDC7
	C6jriiKgMjHVjl/clIoGZnvhYpu7lJjopnwtmAk5U2aOCFI2uYoRwQhA9lV79inAC/15tjEQ5G0
	U+YveUuovp4b3UYsvyOFtUU/kSPuIDjTxa7q1UvFwiWLEobccGARNjz5AbMea9pOKfhB7XOSHir
	V+bAzo1p+oEmpUVNSkk9o5vkMEvCYjzHVnPR/PlYMeks7qmKmhLMSfVb85dTxrjMxTLUMA51uqb
	A/E68+3Lcyes5IxI2V7WYnNk3ma0rp5pW13s96Dh/arCzWFuUnudxg4zAPmh9WpsgIslaTUhJLr
	mtZsgbQ==
X-Google-Smtp-Source: AGHT+IE2eMw8BQuhBGFL7WlqYAYwOfpD0RWRv+6XYnYowDEDGfdkOuVDdDkDSMWRKqNPPKOtXVF9Nw==
X-Received: by 2002:a05:6a00:a8b:b0:736:57cb:f2aa with SMTP id d2e1a72fcca58-7390599d5a7mr31035878b3a.13.1742972215853;
        Tue, 25 Mar 2025 23:56:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:56:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH 00/10] Add SBI system suspend and cpu-type option
Date: Wed, 26 Mar 2025 12:26:34 +0530
Message-ID: <20250326065644.73765-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235657_349987_0F3680E4 
X-CRM114-Status: UNSURE (   9.41  )
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

This series does the following improvements:
1) Add Svvptc, Zabha, and Ziccrse extension support (PATCH2 to PATCH3)
2) Add SBI system suspend support (PATCH5 to PATCH6)
3) Add "--cpu-type" command-line option supporting "min" and "max"
   CPU types where "max" is the default (PATCH8 to PATCH10)

These patches can also be found in the riscv_more_exts_round6_v1 branch
at: https://github.com/avpatel/kvmtool.git

Andrew Jones (3):
  riscv: Add SBI system suspend support
  riscv: Make system suspend time configurable
  riscv: Fix no params with nodefault segfault

Anup Patel (7):
  Sync-up headers with Linux-6.14 kernel
  riscv: Add Svvptc extension support
  riscv: Add Zabha extension support
  riscv: Add Ziccrse extension support
  riscv: Include single-letter extensions in isa_info_arr[]
  riscv: Add cpu-type command-line option
  riscv: Allow including extensions in the min CPU type using
    command-line

 arm/aarch64/include/asm/kvm.h       |   3 -
 include/linux/kvm.h                 |   8 +-
 include/linux/virtio_pci.h          |  14 ++
 riscv/aia.c                         |   2 +-
 riscv/fdt.c                         | 247 ++++++++++++++++++++--------
 riscv/include/asm/kvm.h             |   7 +-
 riscv/include/kvm/kvm-arch.h        |   2 +
 riscv/include/kvm/kvm-config-arch.h |  21 +++
 riscv/include/kvm/sbi.h             |   9 +
 riscv/kvm-cpu.c                     |  36 ++++
 riscv/kvm.c                         |   2 +
 x86/include/asm/kvm.h               |   1 +
 12 files changed, 268 insertions(+), 84 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
