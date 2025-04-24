Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756F5C369D5
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4/zTpEh5H7tgQYMzsmLliN6lcx6mNCcdAp8V3vX0Mg=; b=SOAY99Zow+R2qW
	reGsqNNUeMBH1qM0Cwj2eb+BgC19eanBCYMv6WIyqHh+1+7E9sldeH960HXeptXPLcrXW0z4nNFtd
	1OA04kCThclZ4uaCaLRbXzEDFUz0rOEJtfiLHJMb8Vq+76maQpHeyTalsCGh4iIgU72UEZB6lGsfQ
	BcPkpE3bezVr/Mj95YXlDQ5yAcIbqqZAcM0svq7Iwp70AJ0gDSN+vbTDE1oqt81jWlx/OrLGfojXS
	hpsi0otJfFL+OqOiWUEbM/K98cmjIvOuPNhUu0nAKHuB3XZW+xgHJRzRqP/306eOldKfRWTueP5Re
	ND+C8vDxFRtIYq6cSkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6u-0000000Efll-2i4u;
	Thu, 24 Apr 2025 16:07:36 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yZ8-0000000EVLc-1F1q
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:44 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso1551257b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508761; x=1746113561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9/1qWtDS6xTLdJMtcRPhkRNGwQw4N6MsnqnwpODYYU=;
        b=b02ccjAu5yUAuc71PbB7iH3/YC7hQH527oeOLKGAdHwP59lv+mQncjO1AvJKJLUW7R
         13oVtoPjq6VWzetFiZKb9uLN/fOhygptQYfV3P/eYyAXsxyVNikg21TYqO1Vr8K+DJOp
         SizCce8q3wurOvFHzZPPur9h2g7yEQDRsBGPeuCU3Iy9SIIQrHEMX1sB8dWNrKxg6Fcg
         Ef8QCKvoly+EAoNU79TUZh4BAOSOUdp17Y1zPiJTQDy5c0QrZqMLm82tOOOQ3FvjLoYr
         WqduWhQx6taZP5NLxLdn0+PGNi2leJE4dtLmhrycLP2TIvDB04dwJL1UKk6fctFiFE0c
         OFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508761; x=1746113561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9/1qWtDS6xTLdJMtcRPhkRNGwQw4N6MsnqnwpODYYU=;
        b=B3dhKaty70JXWWvZPrsUgmSc1CWb4nVuAuykYGPCHvKdKkrkW5f0S4RWYHEtEszw+q
         mTtuWrTMrAsBeJLZvLY/AfABNfaT/LkYQkiINoSWr4QBq020mS3KYoueLRj332WVHOLo
         z1k3OJWrD6pK3eIl+axrRyZfMxTz84/RWajqleCaH0h53vBrXo8pRL5bF4x6eGAsVnZG
         Xvi4PH0CGnRXC5s7MY+1jk2QwXEgUVbCMVOHQh68CZaLTipEvnMSkkCJHp+G/py1SSxI
         Lbr6PQb0LVTesKXrDxUtMROEygS8j2bvz4gb0/T2wa9Os/EZoYrJbUS0Io/rHVbj8KFl
         9Z8w==
X-Forwarded-Encrypted: i=1; AJvYcCVwpU1FaaTzi8YuyY63yQKgfhAzVnHbw2iqMLkLYjnm1/tuVOq9rip4Q6gEVKKn1ZwP6Yo395E85Ms=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHkbS6gHSwcIURNe3am9rFbHCSAlqQ6MgFbuMxVt3BCo2e5aTA
	RTD64iES/D+rwIF9jGp1/EDQdoH2xXt0FUZ8H53b42F3grceVnc2Dk9+tcr+L3U=
X-Gm-Gg: ASbGncuBU6BHOTB7d7lNJ4gaAy7k5VR5crG7rCanfWpuZbOIY4lD4hFFPcpEKJwRZr5
	9H3FgeBWnfTqzqmJP6//zJlrYNwL0fJz3g3E5rw9EwUQzcjwcRiQgB3xEwFTTMtz7ktXNyndicn
	j8pq9UdUuq8+9+hgGBpEqFrqY46vaXS2HQd5ZmVl28lelEImNzcnhXmYPv08EsCbtIVCKs3xkjw
	umgTAc6KDS/ib30ca1oibn3+CgDTq2QzWcmj8BUDIIjYd8EKSvC+lXq5iKk1y9/KoKeQj0LsaLC
	v90Mdk0Y7X5E3i0MnLH/iMrEiXdTMj4B6gDd4gTkuTDA+7LWACJkH8SZ7r8LvzmP29McXEuNbxe
	kJ8IU
X-Google-Smtp-Source: AGHT+IF7K2bMCBebnT9LwgduuidxGRgYFCLYLlDVmnaUdkMWDHmiUi/EPjiSU66dMxFVcXl3y3OAOA==
X-Received: by 2002:a05:6a00:22c2:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-73e24ae669dmr4974975b3a.24.1745508761140;
        Thu, 24 Apr 2025 08:32:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:40 -0700 (PDT)
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
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH v2 07/10] riscv: Fix no params with nodefault segfault
Date: Thu, 24 Apr 2025 21:01:56 +0530
Message-ID: <20250424153159.289441-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083242_333011_FDC83B72 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Fix segfault received when using --nodefault without --params.

Fixes: 7c9aac003925 ("riscv: Generate FDT at runtime for Guest/VM")
Suggested-by: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
Link: https://lore.kernel.org/r/20250123151339.185908-2-ajones@ventanamicro.com
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 3ee20a9..251821e 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -263,9 +263,10 @@ static int setup_fdt(struct kvm *kvm)
 		if (kvm->cfg.kernel_cmdline)
 			_FDT(fdt_property_string(fdt, "bootargs",
 						 kvm->cfg.kernel_cmdline));
-	} else
+	} else if (kvm->cfg.real_cmdline) {
 		_FDT(fdt_property_string(fdt, "bootargs",
 					 kvm->cfg.real_cmdline));
+	}
 
 	_FDT(fdt_property_string(fdt, "stdout-path", "serial0"));
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
