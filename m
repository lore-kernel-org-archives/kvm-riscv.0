Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDDBC83030
	for <kvm-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 03:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=asGTG9+EzXdrjx1ggkZhtEKiFYE+ek8bmIr92VGuJO4=; b=ZI0jU3T0pdL6Ry
	yodecPVl483f9EWYDKD1NjK6H+JXjekvi/kRaCnyICsgat4B/2ODvgytDRSzTmreHMyT6on7681fM
	3nZVwlEr5V2fbTpbrv+oC+R2WRf6Dowm0H5MB9llH7rz0DzvRztUapx3nGssuy/fAO1zIAeVe7906
	kx3PbDMOEaauj8DjptLrkPV9C6Yt3cE9UdtenqIGIP7drXLXhJgwfoO7j+YsyVwbrIVV7TY1rHxl5
	LhORAivEt/4vvhDMgWBsyarBcPXswzF4b1G6xI4f6Cvq1I2VJhcDWItLWQ/m0T31F77cCnBwLVYr3
	3ci18GAQ1t3QptudrmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvW-00000001Kj8-2DLn;
	Mon, 07 Jul 2025 03:53:58 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvT-00000001Ki7-4APN
	for kvm-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 03:53:57 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2711914a12.2
        for <kvm-riscv@lists.infradead.org>; Sun, 06 Jul 2025 20:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751860435; x=1752465235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5wHfXXQ4zEBMf9atQWdwXzfnG4mDo9qjXuqOPXqkyY=;
        b=ZHsUDthyyMA/DqDwRguDvK2dQq+aBL9+4xhOWmrpaD0ST/f+onR200rkNUAxgdYCqx
         AE5Y3CLZtS04cPHeZ+41STS8MrnL6RtnAO9RDHpbSRgjNivpiwGvTmpVfEP8mLes8ohG
         +oj669x2CzejqvY6OvfdpDKRJB0DB/giif6tByQd0JkvQ+Ajk5+BQdlyB0ZbWpxtsjOI
         S6WGjdx7FKUapYMhaRsJjN/NqujD4bJ8GejtsqRu97q1mO7gI5DP4+05BtF569+dcUni
         InNBhhcgbRvKieZZVG2eYcgoG4UpwC25uGFMPf+C65y9VpZE8q+7tTO5IC8HUIAxPDJZ
         dnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860435; x=1752465235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5wHfXXQ4zEBMf9atQWdwXzfnG4mDo9qjXuqOPXqkyY=;
        b=fYHU+sykM0COHIxILucMV4TMuFpvaZ/kOJgFx4+8fZIXs51UsqBd/SxI0qgN2Yb66p
         1U22fYES3uvd1OjORoRUL8ZFpyXEOBcynwn8F1xTW7OEIwAorWjZfTkAo3dLTh9vXg06
         72+LJFuTtYhSXBkObCTXmwS0P/No4AN4OPuXnlDIJxOGk+V+xuQpOT8UplG/k/gSjvNH
         IDwrAwN9oZ70hIfbV1kABHmUwkVHy0fLimLV0OZzdOKOmVZOXIkbrXzwDbZPlDaUtptj
         zsaeC+PcrNe9UCzp/ZgUfXFG8yvqAKCyMlD1iRqFTB8orib2L9gXSi/Qew+6wlxFsBE7
         sI8g==
X-Forwarded-Encrypted: i=1; AJvYcCUzkoaIVsiy20iAjRSDW9XATrBwVTSc5lC58bIwypJOoui6ozku0/HseXOAGBRV9aZL8IKdK5xzcoI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3cw1ZJIEezWhtntoZyOzVqysWfnTyNAUO6DD8HUTuicoEdHKZ
	uCEmSwbR2+itYxoZUWgpEECoAEjuGHD59Pl7Js1gT+CX2+LW6cKhNLnoJiyYeFL0yx0=
X-Gm-Gg: ASbGncszMIvIJEqGfRfhSXnK9OaehLGnD0Z6vFiRXNGYIQu1jYQPoyFARGRdQ2tayhF
	MG6zXbOXu6Omr6buDj7ks6EycZDIApZQPbz2zvt2kylbzQGtHUFxHg96wQ3VvRd5Hcglm/s9HTP
	TVJr1MYHXhgK+j79X2wKu9GLIk61jZlQKZBKQj28GiKjInTTvrs1mEHYdQeB/i+/YxXt0B3nTZw
	qBOrSCsQD04BszUzpDaS0vVceMvAxQyHv5Aa9xXf3fdiyBHGQmQJzUwM3u1t+kFkXA5xnvIvoJ5
	MYsg6t1vhfkt3lMZj8VMjUFLnGKFtIlqyZrwF/kCWRNpvJR266YRydPcoLWU2UgK1pHNFYBHE42
	FDNuZ9tGwqJkmUlFL2Xo=
X-Google-Smtp-Source: AGHT+IH3PnAiGTyAZ+6qYrNH6yhveNJVZ6r8Z9td+wti94tqoIsXso9lzCWFTyC7yioqYXSlTSnKJw==
X-Received: by 2002:a17:90b:3c50:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31aac447bc9mr17532339a91.10.1751860435085;
        Sun, 06 Jul 2025 20:53:55 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae80ae0sm8159137a91.21.2025.07.06.20.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:53:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/2] Few timer and AIA fixes for KVM RISC-V
Date: Mon,  7 Jul 2025 09:23:42 +0530
Message-ID: <20250707035345.17494-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_205356_028420_71D902A0 
X-CRM114-Status: GOOD (  10.14  )
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

The RISC-V Privileged specificaiton says the following: "WFI is also
required to resume execution for locally enabled interrupts pending
at any privilege level, regardless of the global interrupt enable at
each privilege level."

Based on the above, if there is pending VS-timer interrupt when the
host (aka HS-mode) executes WFI then such a WFI will simply become NOP
and not do anything. This result in QEMU RISC-V consuming a lot of CPU
time on the x86 machine where it is running. The PATCH1 solves this
issue by adding appropriate cleanup in KVM RISC-V timer virtualization.

As a result PATCH1, race conditions in updating HGEI[E|P] CSRs when a
VCPU is moved from one host CPU to another are being observed on QEMU
so the PATCH2 tries to minimize the chances of these race conditions.

Changes since v1:
 - Added more details about race condition in PATCH2 commit description.

Anup Patel (2):
  RISC-V: KVM: Disable vstimecmp before exiting to user-space
  RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization

 arch/riscv/include/asm/kvm_aia.h |  4 ++-
 arch/riscv/kvm/aia.c             | 51 +++++---------------------------
 arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c            |  2 --
 arch/riscv/kvm/vcpu_timer.c      | 16 ++++++++++
 5 files changed, 71 insertions(+), 47 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
