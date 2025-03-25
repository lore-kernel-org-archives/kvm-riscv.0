Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8098AC36010
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvUQNz338ygeZ9hqHwYLfK9eQhAK8D/InDKkkbtHZJA=; b=QZc5RL2AfEbGar
	JMB346STk5cRn0J9EZ+f1NZhI74yTj5y5Naxb9eRTTPlTR11d2hFgIkB+FD1eg26DuA9Ltip51/Ja
	RDrF9fMh8+L5BLF3IXJLZYnp88p0pibcVR6wYmdYeE+cHN5T/GWx67n8xuWHR8CLYdQxj59azoT1a
	0e9gzk3BDG8RdZjLYNKIpR8wSKUrZSWl4DzaBdb5G2tRI63yZ1OizeAKkxP3n6liShsHcTBLK4Eiy
	ZHvjR26YV6eiqOvd980jp4l3q6COek4QIXERWIc5+MLtxqrQzvXcLTxNNSpOM2Sk89vQTsonzFtf/
	VzyRzeVzwmto1Vz6mDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6yv-00000006SWE-149v;
	Tue, 25 Mar 2025 16:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6on-00000006QwO-3Vbf
	for kvm-riscv@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S/KkYF0WM2eQ4j8En4HnzFELDHrNfXIe/+MMpGwXHj0=; b=PZ5gWjTmpRECO4JMdREaWW2sTV
	pRbVl+Gctr73QqDwkV5yGtojRPHXcRuigObtxGBkkgbjjc40xcVn13bINqD+FUtgMGaCvuJ6b7X/7
	3FFjObRDyLTe6v+CvKd2gvHehjA3jofbZvkpAGLU+pCUC+v394iTSDlCfwUQgJeTCfxme8RdnfpLn
	UuLww6Nu2Gi3NmsDqXboB3ZzJ/zDfdA84iU+17KW3yg9Jm5YgySgh6lRLx3eZ4/blIFuwTVM6Hq6a
	g2EfXHjLC8tHC6msmF7JM00uxtUgSQZy4ePkvoBYhQKoqyG8fq/8MnA6t54F3fggbf0bwDbLeD463
	d9dvDt/w==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6ok-00000005daL-3i0e
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 16:07:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so43595785e9.1
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 09:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742918872; x=1743523672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/KkYF0WM2eQ4j8En4HnzFELDHrNfXIe/+MMpGwXHj0=;
        b=ar4YFJpxpGdWGUgTdzj5T3I4Mbcmof8d2ZZHcI7qHWuJSP5swE+aWcgScbsDSf8iIB
         YeuGaTfp88T9EquwkMRiGTps2xKS7DD2ceFMOKyCWfXSaqSP6pk8ZvObB+j0iZVyrG2e
         850bQWCgqi1oXr3jG04BUinp8D4nuPQ7Q0mZpIQPSzoLVjIfCJrHytj86jWsyty05wiF
         sVrLmXMJ88xfeJa2xy+JaTjhrRjaKJA3zXFMqIkGlZ0Ukr+bDenlGEvtSfraTePpwiIA
         lv+mO1wqU/TGkhkhs6kA5RxpN2l+Oh4vYbb8dSBhIMDSfTXgGC5ORznTkfefW79lpgo4
         NXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918872; x=1743523672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/KkYF0WM2eQ4j8En4HnzFELDHrNfXIe/+MMpGwXHj0=;
        b=A/V9UoYiTbeELO4iQq+shGQS3fbQZia1Ix8VlZzGXXRyJcMyVIKklYVYtgzX/SInG+
         nKZg4UUWxEJ8ftfD3m/HfPNT+0z3IexYzLEyYrCCsSbfZ7pNUAwuC5DczCRhTFAoTSFO
         9QTan8x/UIpRKHaZZ3VQeI4hsrgHpVurCrhZXUQyGhvImw1iNdD4VrCXq8DFrz9icTom
         KQIvYInsFgB50A7NCTj073tskZkqCvrDLpWLMyPKK2rrxeV/0Jq8/UIJtrBFnupPpBDn
         /5L1djoivAiE4fHRi12Ofik0VAhzORXvutGEY/uHJxHHEwttiaUUlpXIspVQjbDPBhrO
         UMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEJINya1/vkM1ZEAYU5ayJw4wkgMxeUDiv1Tpb3eOCL6q31cQD2DB2yQ05uc15kXVgMs+ISCZZyNo=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcc6ln+UXKpk4No/LGjQiPgwoaWatui8HN3t+rDUuolkj8DYR1
	7FSmnPXGvCuw4R6k3qkMAfhIIitJflj84eT9zVs/bENEEsrcYrtFzxPXLAdjbnQ=
X-Gm-Gg: ASbGncux1v2qnr8+2YaYEFTAE464nKFiojaMJCiQ61+e7Pc+VGizfGXzCYddfeNd9Xx
	XTrJm2h/VuBIE5i/CJ6/vxLSd0v5tSLzG7+hEnTIKcZs7KMxacwBe0HUwiqMWrU9zvNlIp2y0+9
	a9YlWwHaWH92t35Yf0FrC65W0qJwbmFfwFZIHaitMozTo3AlZX1R1/TH91FrJAwXrwXY4UTV14P
	4uzbFo3CZbcZPqTInEvpEi0r9huMaaIRHR0R2AOjKXhaRJ/5fMr2E/lSRviN/SJEnp2UyNNgtEv
	VVTxTQozE+mGVUpnVUnWKj6n+k0m2IML40JQN3krisAvbRt2xcfjAp3B0c0eE80=
X-Google-Smtp-Source: AGHT+IFq4u+jQ8viBriHlPpSVQQmxgDxEvO7i8h+fg3MJkOMdTrOtVoXDilCPLi/MpwsyJ14xZjz8g==
X-Received: by 2002:a05:600c:c0e:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43d77547eb1mr3370805e9.1.1742918872581;
        Tue, 25 Mar 2025 09:07:52 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm203972195e9.9.2025.03.25.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:07:52 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v3 5/5] arm64: Use -cpu max as the default for TCG
Date: Tue, 25 Mar 2025 16:00:33 +0000
Message-ID: <20250325160031.2390504-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325160031.2390504-3-jean-philippe@linaro.org>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_160755_035826_5116D24B 
X-CRM114-Status: UNSURE (   9.72  )
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
CPU type on arm64. Leave the default 32-bit CPU as cortex-a15, because
that allows running the 32-bit tests with both qemu-system-arm, and with
qemu-system-aarch64 whose default "max" CPU doesn't boot in 32-bit mode.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index b79145a5..b86ccc0c 100755
--- a/configure
+++ b/configure
@@ -33,7 +33,7 @@ function get_default_qemu_cpu()
         echo "cortex-a15"
         ;;
     "arm64")
-        echo "cortex-a57"
+        echo "max"
         ;;
     esac
 }
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
