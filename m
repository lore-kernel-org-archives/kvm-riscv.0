Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5950C3ABB9
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FAmIMLWU1HVIesNuNFkFzoaSMhKPA+cUX168cVAie4U=; b=N+gw6dRnv0v4q7
	qTJAhCc5v0FfT+rL9z6awF68CBsGGyH+lpbm+Hyj7dL2cTjBc+DQ7ca1SkIGa2fpd+Xe8ujF7OTWS
	LnLMzFGKlfVAxH9i/wjSpUvmjTdk5762mlsSaH3vNSBKw8ufA+9DlVgxCehC5AZQUC8l1/e4LUTgk
	y7M9plrXCmnCb9vbVWdDPzn8VoqhYVjW/x+mYCuDjYbqNLa0RLyiLIyM6ImK43lclP4vI49KHXljG
	bTmKsw+0g8GXNAhXjizq1MWCEu0V7aCaJidEhUGI0UZ33+B+avctqt60qnGFrUJ/g8DugS3JFHnC7
	yKvVtuLwnDBd93perqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3MV-00000008cGf-14Pf;
	Mon, 05 May 2025 21:28:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3MS-00000008cFv-48TT
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:28:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736c3e7b390so5736316b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746480508; x=1747085308; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26hdnx+Qx/nkLZaujdf27gbYCjpgudGZl7RnEQteaII=;
        b=y11KCZLlOrFhU5yztrZg7zmsxo2YWi2ctEEUHhpCN4z+VH4zj18B2IO7/jNo9PmlmK
         vm9PjXzJSbxmRzeVrenrkCcr9MFEX77OHjKo44tx7TdPmyEQ2nxwYBtOBwZQHYXqIftU
         TNs/N4vWwdG3vOU+iOVccfTPjGjs+0LWFd6ETx+qs6gatlZ/fxPgwlHDnh4CKF11wfm8
         pPvhlXxortSFc9tNKWN47nL8F/0v/YnUraFaJJttVWND3Z0rgG4ViT1iVtAerabaNahv
         b1zRzR3pA2V0uw+v+eujiq45FykiG4FXYM6u96Ews9r6rtlbg11FT4DQe+2z3GyMVLmY
         l5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746480508; x=1747085308;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26hdnx+Qx/nkLZaujdf27gbYCjpgudGZl7RnEQteaII=;
        b=V0XyGJrl1LWNRxqoB6yauFsz04fgnCPqGPXzlFQYvKck1ipEg+kd9n71wPrJ3p+58Z
         GEZ6YgV6qqdIpkGzxN5xMsqm9hSWVLS7YFfFWvmuAGb5GMmMmdorKrbnK7doF2+kCO61
         vNWt1m/4mmIwvVIO98pL4roggeEJ0NBKljIMLE5TeAu9gS0OHGNFhYhBFEjI99MsWxxT
         b0SaFWRx0x0F9XcQ1rYKWqx/mx/J2Sc1DbLT1EPjNLr6InfX97LyLB3DvnFmFXqau7r7
         Z7x1zB+6MdgBxLp9GzWQi8l1LDgbaYOLAEfknwe7QJusveW3OP8DFeyBgxFYDgA8CfiC
         rBwg==
X-Forwarded-Encrypted: i=1; AJvYcCXpBBJDFs/fEpIObC4+QYKBVDxBr5lRS6Sc9/1dsNaz1IJWaXIiFFHoBcXNGTiWHZkQpEYL2NB+4aY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwR5/951ykNIysnvY5hZjrCXrhPl6hxTaxHb+JKCitpKcex4vt
	6fEWR1iOHXjUZhct/tqbOu9dqWc+HNbjlXzvZLepPfW7VG1ygN/cnhjNpzY7PUw=
X-Gm-Gg: ASbGncs0keC7IkLqOCES8MkrBoyr4CZJ1rn0Ybza6zgQE7+WfMzC/HhGpR26SJGZMOv
	OPInU3Ka+sNopyfIwGCOhW935ZG1BQWBYNzFpkx+hxz5eAMP3Bft8Pw22mHvuIAc6G8GEHoicwn
	1lu9NdJXzzR07ZojU6Ggcb4XEH5o/udUAJj2abcms4/lMnRIeDb6aheVgLxt4sihJ9tqzUVx90/
	/pXH2d0y3CZDtsJgdhwopMmJxBCUDs/cz0hAiGZoVtcDK8ZU8Vr8EYdv+o8jXixgy9kEOHboHwl
	e0etCOTVWSxSwj1wEPpRjy45aA4xiIhoKsIYhhU/5iLL7HGvxcE2NA==
X-Google-Smtp-Source: AGHT+IHEMWsBZWNumu9i00+bT5zqJ+OBY6gmgedReBkU4n6QkDfOYR7NZTzbvbGaF1bdlf+ezbf61Q==
X-Received: by 2002:a05:6a20:ce48:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-20e96ae5978mr12840533637.20.1746480508080;
        Mon, 05 May 2025 14:28:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dedcc4sm7370367b3a.79.2025.05.05.14.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:28:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:27:38 -0700
Subject: [PATCH] MAINTAINERS: Update Atish's email address
MIME-Version: 1.0
Message-Id: <20250505-update_email_address-v1-1-1c24db506fdb@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAEktGWgC/x2MSwqAMBDFriKztlALfq8iUop96oA/OiqCeHeLZ
 JVF8pAgMISa5KGAi4W3NUqWJtRPbh2h2Ecno02uI+rcvTtgsTierfM+QEQVval1VlclqpJiugc
 MfP/btnvfD8uL+XRmAAAA
X-Change-ID: 20250505-update_email_address-6c2901987e87
To: Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_142829_300349_D3B829D0 
X-CRM114-Status: UNSURE (   7.86  )
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

My personal upstream email account was previously based on gmail which
has become difficult to manage upstream activities lately.

Update it to the more reliable linux.dev account.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .mailmap    | 3 ++-
 MAINTAINERS | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 9afde79e1936..f7a81702309e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -105,7 +105,8 @@ Arun Kumar Neelakantam <quic_aneela@quicinc.com> <aneela@codeaurora.org>
 Ashok Raj Nagarajan <quic_arnagara@quicinc.com> <arnagara@codeaurora.org>
 Ashwin Chaugule <quic_ashwinc@quicinc.com> <ashwinc@codeaurora.org>
 Asutosh Das <quic_asutoshd@quicinc.com> <asutoshd@codeaurora.org>
-Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com>
+Atish Patra <atish.patra@linux.dev> <atishp@atishpatra.org>
+Atish Patra <atish.patra@linux.dev> <atish.patra@wdc.com>
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com> <akdwived@codeaurora.org>
 Axel Dyks <xl@xlsigned.net>
 Axel Lin <axel.lin@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f8688630c01..cb8cd92a1ce8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13071,7 +13071,7 @@ F:	arch/powerpc/kvm/
 
 KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
 M:	Anup Patel <anup@brainfault.org>
-R:	Atish Patra <atishp@atishpatra.org>
+R:	Atish Patra <atish.patra@linux.dev>
 L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
@@ -20878,7 +20878,7 @@ F:	arch/riscv/boot/dts/sifive/
 F:	arch/riscv/boot/dts/starfive/
 
 RISC-V PMU DRIVERS
-M:	Atish Patra <atishp@atishpatra.org>
+M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250505-update_email_address-6c2901987e87
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
