Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8AAC35FF8
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBRiBrZZx8Opine7k4U2h57+tmD7F5KBowxaRt+EmSQ=; b=KqMuWYoXMCTq78
	kghXp0gbuo6AqcISDUwTbBRr0P+9MnVyZT1buOL6kEqb30A7d59JIyx/mWi6Okzp0GKO8nXqnCl8z
	iyz3hFEiMZ+WW/CdPINc/EllZZa+YXiLJNpUa494TjBqL2tKTafNuMEkSWvlGk6a9jrDjDDxiYvTO
	Sc7PytFuKW97t1yhemCopuZRBJE8qDB32niGgqoAjdrncTGKz9k3GV2/XKYhag1w+/IgT4f2zWjLX
	fwGL5jTIglOu/9g+B9RVDNEOcFlj2jkHaU2+LDQ/UpIhDEbGQVwYZxBywFOWrqw2DPB0NTZeEeCti
	9q5bsRG+d26liu92IBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Kp-0000000EdEC-1Yck;
	Fri, 14 Mar 2025 15:52:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Jf-0000000Ecy2-0TAX
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:51:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3914a5def6bso1265279f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967477; x=1742572277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++RCXC80KQUw+yCRaKjq5JOqlP9+bD2jusr4EJFhpro=;
        b=g6q2S9GlpVcGKQpWngU6Jaaq8Si7NX2W6TOtfEMCf5b9MVx67GGx+0B7UDM1vamHDe
         t1/o1aVrKa7fg7+UxeV+oezN7pceslfJqqj6PAgX0yWLowBQv3Q36BfF53Um1UrVHzXM
         JGP9sOpg9G8gYuz0rls3rF3n/qzQFEd7Oz7PQMxu3ZzLU1rnlH6HE5pCbKENe7IItQ52
         OrI7+sMjr4X/Bl3AsWhnMA+a+bVfatGa7cJgo3O42P4BI02DjjhzAdI5vOYLOucG+ZzD
         GcectuEQ4skec8fwbCytowr66nuoQCn0/rinTHACZRqVx0t2Qp+HxRJfQugioh/Fpphs
         hExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967477; x=1742572277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++RCXC80KQUw+yCRaKjq5JOqlP9+bD2jusr4EJFhpro=;
        b=tGtQjqmlEFE1/+68h+VRepBUMpnA0nHZJO7+Zbs21hNI+JM7SQBicqPoQ68BSLM40z
         t3D7W4HwZ4ekRFJsJfnu9R782POtw0D8t05PnF1EFpZ8tJXmO5aAZ0XjjeAnh81rodXL
         Zbih8HlepNQDLxV2fOc46eI7X8U6VQ039Q42hFY2P3kPBATes8h6QwhqkDPz0PuAlvq6
         iIrpodZhr0KYvlMrmGJioLpuylc4swjvln/2UzCgbaRdjtCE/b1EgXMcI8dcT5d0yyY7
         W95Sqkc8VVDm/aVg2Ps30rQ0NRrIh1vszDxZ39mHvV9+EV+dh1/ICahlyWb8ldoZBphM
         19oA==
X-Forwarded-Encrypted: i=1; AJvYcCV+3E2kYVCAxQUIA+A68YqZD+PyoGHsbcQmfM61b5q0aHGyVcm/Xw2/sE9D0TI5Fj0x5FAIR/EU+gE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTBkhxV8oe68uNWxizY1WfYxzDznUM3TBywRJd0eFeH2ujd3aE
	a6F4SdxcKzYx90XiIIfa136SzMjSQ+SWUO40N3WdfMqxIGNdwvCBliykKRq9Kv0=
X-Gm-Gg: ASbGncuJYtOK0wD2IfpUoNr0CySRkLaAd6PJOQCiv142gFKHdtmB6uErjzRxlOt5n0J
	/9IgFjWgSBcmIDpF1ZJJmu3uhavFBf2wn+I5wYB4KdLvXOUAnPUao1OOl3MocOldD5VIXNPahyG
	KGaymFgxJuMy7f5tcXZtGiZV264jPxX5PDgrhiF9NMETsqUPpdWuH/xhZXtjhdNSk/T7Y4A1jeV
	orMLgrnPtdmU69yWhbsydDFn1P1OGBA2r8XlmQtlOBiLjDsrpJqoM84GdOxxBcCUhdQF5woWsvt
	Nk1/2Q8b5hRarwgw8K3QP0lY1ttSP8krVwSI74slrOtapfysqiz3cV3vli2hIe4=
X-Google-Smtp-Source: AGHT+IEMzZIo8rHTV1Dy8xpK/5z2eXt1opT7nvqywgo9i0ShyunydBCLs1cS/ckJWtUYCIoMRCwBHg==
X-Received: by 2002:adf:a454:0:b0:391:4ca:490 with SMTP id ffacd0b85a97d-3971e3a5680mr3380574f8f.29.1741967477465;
        Fri, 14 Mar 2025 08:51:17 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d21d67819sm15249945e9.21.2025.03.14.08.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:51:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v2 5/5] arm64: Use -cpu max as the default for TCG
Date: Fri, 14 Mar 2025 15:49:05 +0000
Message-ID: <20250314154904.3946484-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314154904.3946484-2-jean-philippe@linaro.org>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085119_176026_ACCE539D 
X-CRM114-Status: UNSURE (   9.57  )
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

In order to test all the latest features, default to "max" as the QEMU
CPU type on arm64.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arm/run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arm/run b/arm/run
index 561bafab..84232e28 100755
--- a/arm/run
+++ b/arm/run
@@ -45,7 +45,7 @@ if [ -z "$qemu_cpu" ]; then
 			qemu_cpu+=",aarch64=off"
 		fi
 	elif [ "$ARCH" = "arm64" ]; then
-		qemu_cpu="cortex-a57"
+		qemu_cpu="max"
 	else
 		qemu_cpu="cortex-a15"
 	fi
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
