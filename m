Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F08C369A5
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FRafwjzOMdKCPd8SY7Ui4fzTMWL5I9BIkb3wUvtnLP4=; b=oOBWOLhoS6bxRo
	piyK0N/fp6CRa1G85La9DmcBobumZuf6XVJdn5DR2zQTu3g4tofKw7zc2bjxldxGlXddQprwz1hdX
	MQSJNY1T+2XP1wW7mKf88n2u9G+G3JaCuIgH0HN7Jf6Rh6OUYN/4luI6pz6bTpMB/Oo2KeGdWVRSv
	SvcQYpeO/qUydHSywIYKS53BCumUdrr7C3Mw+AJhYFoXutRTjMhW1oKmd7/jIRT1e17TxtkAudLdK
	NsSmybSGG1jQpxrQM8y+NrVk/JlqSWY8mP1+F9K3QUBsxO1riQURiYYiChYDQqy2cfAo/wwi3a7FJ
	qeZaowPxfRBqMDTTEdOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QF-00000004HH1-3Ki9;
	Tue, 08 Apr 2025 13:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t2-00000004B79-0TmT
	for kvm-riscv@bombadil.infradead.org;
	Tue, 08 Apr 2025 13:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tLzGVjfFwFoyJPuo3LFygEBdjW+ximdrgVz6RHGw44k=; b=NREfyBwmEY17RfGuSDB9qkdPH2
	w6il8x1l7bwQhqxQS1ef8WQSs3C99KJz+SI8bpd21YWsjwnWnKl1YfK3O+U+T8OE7m9fSyIXvJmOJ
	EDGiq42EIvxB6ugnBPMeSi2NSPY1sZsMD+nBqTjm30HHvvAUPXKUTEK9lCtBRo44HOQbbwT4ml9rC
	2h1qx76EVMvulP7TemhAM9gQwtXMeEPkajwJipdsaJ5hAGyDZHNlfC+kdghWTym3QA4g29trSjQyK
	VICF07DixyBuBOflFpu6t12V+Ukmc43t6fdIoWOu3zwXj+J53C24rVLBHOLAxuGjkoUo8/EFpcuNl
	nL7HmrNg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28sy-00000008JCg-3HKy
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:21:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf848528aso44520705e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118462; x=1744723262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLzGVjfFwFoyJPuo3LFygEBdjW+ximdrgVz6RHGw44k=;
        b=cg/lmgEQHIyFEEj/vJjfM/KaXmM5179gsZUFTOSxCIWU3wXPL2HgHO8mn6e0rNbJ9Y
         iBITv5SC1v2ibpaJgnzhRziOGZMpaKFfZGhUYD11UqePyBtPN4HJW7/o2gVmhu0yo5qk
         IbscKtGMfBtbolk4w9B4R7NQlGLPIPHBNnw12enmgT4O+AzozdX0kyDGX+1X9eG/d1rf
         GgTaWlNZzkUlCtMPHWnv7YC86ZJEjqT6Za098D3560pHo10tIV0F2vMTAWUjuYqgzJim
         kdsyJzUz0PGJo1LQOYUGsKBXxf2aKToNYFqn4JcBuGeaJBL3DZCYfcunBIM4q6RR6sIx
         bAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118462; x=1744723262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLzGVjfFwFoyJPuo3LFygEBdjW+ximdrgVz6RHGw44k=;
        b=spme6HDjrIP9Mr9YeSIbjmfw2WIAfHvVENTebVKyhblMqcBCACc+o7cX0/7LnQJdtT
         P0vhfNI2GbA62Ga8gZLL8Gx2JSF5qpzhrBgygLsTmoe3+CSB6jxHaVD6YQaxxn8Z1TvT
         Mg7LkljOFYIyTFyc0YRWNT0+oaBYZ9FneuJHBN8QFafsbC6LvQfjhSPmSirvMS0sf0KZ
         oet8uTGHDdKDFYgCOyYQFqQH57ykhZ4oSQaA+QknkFmjJHizN6DFDF/AgO2MnXqGW4Gr
         BY64hGijyh/PnidcGZSb9AgMolRNTc5bMRkNB+67xsbc1GkxnQBgdQtd4Fx8UidRS3TG
         yLYw==
X-Forwarded-Encrypted: i=1; AJvYcCVi1I9j0TuiuYPTxOLmaqS9Cw6gv9XOeRaKYTFSIXtdTfMhOgZPabAJg7oEqIic3AtvbKFRsFmvUvw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuPkwAc7Vezz8aD5AKWMKV1TsJoHpZT/kEMaeQ9jB4qwPxxrIV
	10xILdvMxfytpWGVQJF4F2d+MpSs4NkKUXT/V032b5abogGnnbq9M6aYdpzvdHI=
X-Gm-Gg: ASbGnctN+mWATaCQRGu5X3wknXe51AJuNHoLcyN2t/WiQkwCQsu1z3DP13YLaNbwsxC
	0aQQq5a2btiKw897HX1Athnw5DXTnznyneM48qwWa0S5G6tvU+sY+QDF4xhfEcT+6QgBU9Eikd+
	qMq/9jIWZAg1qYTC+Xb0uaEx8fvevCJ0K3zVnapjdJeyyt5G1Fb5eU/d1fD0dDcBlbkJrfvB2Le
	4cPJ++c+NvLjVhV/9xU8NGlX5mbOksCBcBkgwkX6OMaL8yleryhyuSPwLsPd3i1kMP8fEyAlave
	vhEiA0OwWeZqJbkKUi5vV59C3ZPCRVH8Dem+979lZEHHil2l+T2IE/kIfwygbP0=
X-Google-Smtp-Source: AGHT+IFUXJbj+KVBhVs4CmMtvIJd0GuXCkofSH+KbPfymhQIkFcV7EPYfaSIBB6hI0EIGOuLDwtPXQ==
X-Received: by 2002:a05:6000:1849:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-39d6fc49319mr11362861f8f.15.1744118461994;
        Tue, 08 Apr 2025 06:21:01 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm162159705e9.35.2025.04.08.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:01 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v4 0/5] arm64: Change the default QEMU CPU type to "max
Date: Tue,  8 Apr 2025 14:20:49 +0100
Message-ID: <20250408132053.2397018-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_142104_988539_8465CCA0 
X-CRM114-Status: UNSURE (   7.55  )
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

This is v4 of the series that cleans up the configure flags and sets the
default CPU type to "max" on arm64, in order to test the latest Arm
features.

Since v3 [1] I renamed --qemu-cpu to --target-cpu, to prepare for other
VMMs.

[1] https://lore.kernel.org/all/20250325160031.2390504-3-jean-philippe@linaro.org/


Alexandru Elisei (3):
  configure: arm64: Don't display 'aarch64' as the default architecture
  configure: arm/arm64: Display the correct default processor
  arm64: Implement the ./configure --processor option

Jean-Philippe Brucker (2):
  configure: Add --target-cpu option
  arm64: Use -cpu max as the default for TCG

 scripts/mkstandalone.sh |  3 ++-
 arm/run                 | 15 ++++++-----
 riscv/run               |  8 +++---
 configure               | 55 +++++++++++++++++++++++++++++++++++------
 arm/Makefile.arm        |  1 -
 arm/Makefile.common     |  1 +
 6 files changed, 63 insertions(+), 20 deletions(-)

-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
