Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A36C77B7C
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yXMUBg4700ngZ/zTsQDvMsd8IQlRvDZKzEEP1ZzQqZs=; b=WMqfovB1qOk2Fh
	eoprlPQPZkvXv+NVEBf+iBCR0uJMyZif3wgGs8qbxAHVbS7Yxmwn8Ujc8ZjupQWoNneWm9C/grJi+
	NyQU+x674FZ+xmEWyynzEef77WEMJb562fJL3kVaVxqQvwT6YNJVyY4FkPCbGg1/UWhZ1ildxBtNf
	qQiDRYFRFWhCNAMCyGRpAjyUI7ZGaqLWG8ZXuIrGJ99KRHd254XjtXTfnvwTRF0B7/BfG7hP3iIvS
	2ryC6NfhKkfpuxcufcyvmyLQdVHoSRIgBXWhA2QhE2wCUziR9C3Wf4tbjjGvN4qVSvAdF9S/YJ2Jj
	Wfq+3bnCG4Y1LSdyoSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk4Q-00000003Qvm-3AGV;
	Mon, 23 Jun 2025 16:30:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgxe-00000002phc-1wym
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 13:11:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-234c5b57557so42409455ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750684306; x=1751289106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2Gakwz5CFCLNwFITFXbkWwDIUGq5jqZEA16EMP/fpY=;
        b=JVTwH4y+yZj96cne6lWKYRBoYzA5wmjq3Z07heEUOUqgyqEbO7gNQtHmpED8VyhyT6
         ufqn5t1PEaCfrdTfWR4YutYG8Z+noONzJ15nMPjcMr2AmwxrJtg57LskmP5y3FQHtqbm
         XAMwOL1p9B+nUri2+IDJK8JsDJ1Z9VPcWU4ymaDaIlqMHmiWD6u3LWFPJT/RUJZoRud6
         U/3Oazhu4OKFITM6G2u9LkPAmnUEPmIFdOqnZiYDPDT74Wk5pM49fAGb+UAOJk3nn4PH
         cfnMQPvrh6rw3Sldq8eyF+lopVfalOWujCuvanYdBrPYaKd50SqkaDGvUPmHH8Mf+n6k
         fifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750684306; x=1751289106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2Gakwz5CFCLNwFITFXbkWwDIUGq5jqZEA16EMP/fpY=;
        b=STHtXK83Pd6Kx83LU8GKyVvusjfICGXUpANao7KibI2y1XVjoV8OhPiPjhy1NfZ4ys
         BSZ03Z03jQIJ3XER3Fq6qCoFRkayGXnL+5JSOsm7gIialzW53GbmKq34VVHIjoub5h+I
         UrPRBtysww3+ztXdVi4erBjSmA1v5FsH8vW1izpb3naCs29fDquqg58Ne/3liU5L9fWo
         uZDF4e88awyiu8im3gnvWE5lls7nN8FdenmQI6fZzxWG54vZAsTqQ2yanor4DZT5lz6i
         XvUTorA6JBwHKBsidP4gGMk0NTN6X2jct7iH7vc1ejDCy3YpZXkv439KwHDLJHvLWI9s
         Nv/A==
X-Forwarded-Encrypted: i=1; AJvYcCW+ZE2dBVY52xv7RN6+ryiBesUSDgBLS9rVN2e8uOU5qHNf9FqGaYNXAlbZcAHSdEFqAa/pqFTF/1A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpEypCdKjmmqP5YpGcHHX5OLEQWJSg4WeICRHBTvk4tazbAHBJ
	IabeeMKfT+Q3lW4a/Bka8w4Vr6C3RR33qVciv8emn/xzwNkEfrRUpaNTyD/ZdbvXkSuH6vv2tut
	3tVsNr/A=
X-Gm-Gg: ASbGncv7NT5lCNs/UAjDie5Y5xOxSdmAVhTU6wkNa7iQP7ZwocKcmD29qaivx54V3UQ
	QB/EvaFr93x6+737GNkSqekAp8VwCKB24zsugFdIGj/8hn3NqG3igyThY4GoGE2Z4jAzMadCXP5
	jm9AI0Oy5CC8NZLGrBoy+M6mpzT9Sd7MDvlY1H1UrlVupds4F2praRgn1bd7maJUjq5tkafGNcb
	iEA7w12vFm1OoWg2ImNscIH2rToMcVShZnZkiGcq64eZ2NNiieYf5TEUnZG0qnS5R8mKPwCvr0F
	dsmcZfl0wmp3XdliRWxrR15zHuTpVohyb9ioOfDzjztryPYS8LR6JHNXng/iSaXNzaXEyVu+nId
	Ycw==
X-Google-Smtp-Source: AGHT+IHifC/+PjsI1B5WmpXuq47QUumhunagfoijQE93mDmfc0naQ+JWhbzZsBvWPaNEXXfgZDBV6Q==
X-Received: by 2002:a17:903:b88:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-237d9779f3dmr156241565ad.3.1750684305746;
        Mon, 23 Jun 2025 06:11:45 -0700 (PDT)
Received: from carbon-x1.home ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8673d1asm84314385ad.172.2025.06.23.06.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:11:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [kvm-unit-tests PATCH 0/3] riscv: sbi: sse: Fix some potential crashes
Date: Mon, 23 Jun 2025 15:11:22 +0200
Message-ID: <20250623131127.531783-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_061146_504640_91C1BB3D 
X-CRM114-Status: UNSURE (   5.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

V2hpbGUgdmFsaWRhdGluZyBhbm90aGVyIFNCSSwgd2UgZW5jb3VudGVyZWQgYSBmZXcgY3Jhc2hl
cyBhbmQgZXJyb3JzIGluCnRoZSBTU0UgdGVzdHMuIEZpeCBTU0Ugc3RhY2sgZnJlZWluZyBhcyB3
ZWxsIGFzIGhhbmRsZXIgY2FsbCBjaGVja2luZy4KQWxzbyBhZGQgUkVBRF9PTkNFKCkvV1JJVEVf
T05DRSgpIGZvciBzb21lIHNoYXJlZCB2YXJpYWJsZS4KCkNsw6ltZW50IEzDqWdlciAoMyk6CiAg
cmlzY3Y6IHNiaTogc3NlOiBGaXggd3Jvbmcgc3NlIHN0YWNrIGluaXRpYWxpemF0aW9uCiAgcmlz
Y3Y6IHNiaTogc3NlOiBBZGQgbWlzc2luZyBpbmRleCBmb3IgaGFuZGxlciBjYWxsIGNoZWNrCiAg
cmlzY3Y6IHNiaTogc3NlOiBVc2UgUkVBRF9PTkNFKCkvV1JJVEVfT05DRSgpIGZvciBzaGFyZWQg
dmFyaWFibGVzCgogcmlzY3Yvc2JpLXNzZS5jIHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKLS0gCjIuNTAu
MAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
