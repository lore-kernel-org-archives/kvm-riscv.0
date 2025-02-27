Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B3CC19F2E
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eBWXV4MaltMOJo17bA/XLGZYKxCDxV+EeZK6BIgLlgQ=; b=R/qmDwR2cqHzgT
	FX0NSawn/wcDly883pEfWEWpq3usYDrvawRT73RJ7SXPLN4vn14tTgxAEeEDKiT4hi4urNtCbYD9h
	MmmRix492UMjpCwJgwfzj6NpShIWebflghyJxFEuuy6ATLfuUOUDj/QuEx/THdOMPRnGLNuGeCND/
	lEUXeWoJLiK+MCC8A8hRcmClIzxa9oHzJI3IYX4a2eXpmUnoSKI2HBLmtdF4m7HOoxzRdLuTneO9/
	513U6SAgW7w9/I5BBi5M7oHzKJSYe6EkyUcjDpMBvEOHC02bMRAmcW7oBXlbC/YaQ13ZAiGfNWqAf
	9TrOngxnmVNC3zoM5Tug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6b-00000007nJ7-32ze;
	Thu, 27 Feb 2025 14:43:17 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnejv-00000007hBc-3Z9B
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:19:53 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740665989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NWnYG/qWwawrIgPypigyZZOLt8fsYPqKg8PDCNW6L20=;
	b=vSIGRZouBy3d+j5Ziepja2gMNONpT4VPn8YtD/wJZADsEPU5vb46lXnKozddEzMUWUHCtr
	ZsVtE8NfSzqpIXYMunfIe5u+wVbQU03ja7mlPmxW1DZQmeI2H9GGcSZ2UKE/DYRNlhiA6W
	/zelIrk4vOgZ7BeaEJ/wXTov2CSMAWI=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 00/11] riscv: sbi: Test improvements and a couple new
Date: Thu, 27 Feb 2025 15:19:24 +0100
Message-ID: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_061952_309836_ED64DA81 
X-CRM114-Status: UNSURE (   5.19  )
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

SW1wcm92ZW1lbnRzOgogLSBFbnN1cmUgc3lzdGVtIHN1c3BlbmQgdGVzdCB3b24ndCBoYW5nCiAt
IEVuc3VyZSBIU00gc3VzcGVuZCB0ZXN0cyB3b24ndCBoYW5nCiAtIEVuc3VyZSBzdGF0ZSBpcyBj
bGVhbmVkIHVwIGF0IHRoZSBlbmQgb2Ygb25lIGV4dGVuc2lvbidzIHRlc3QgYmVmb3JlCiAgIHN0
YXJ0aW5nIGFub3RoZXIKIC0gUHJvYmUgU1VTUCBhbmQgc2tpcCBjbGVhbmx5CiAtIE1pbm9yIFNV
U1AgdGVzdCBvdXRwdXQgaW1wcm92ZW1lbnQKIC0gRHJvcHBlZCB1cHBlciBiaXRzIGZ3ZnQgdGVz
dCBmb3IgbWlzYWxpZ25lZF9leGNfZGVsZWcKCk5ldyB0ZXN0czoKIC0gQ2hlY2sgYmFkIEZJRHMg
Zm9yIGFsbCBleHRlbnNpb25zCiAtIENoZWNrIFNVU1Agc2xlZXBfdHlwZSB1cHBlciBiaXRzIGFy
ZSBpZ25vcmVkIG9uIFJWNjQKIC0gRldGVCBwdGUtaHctYWQtdXBkYXRpbmcgdGVzdHMKCnYyOgog
LSBEcm9wcGVkIHVwcGVyIGJpdHMgZndmdCB0ZXN0IGZvciBtaXNhbGlnbmVkX2V4Y19kZWxlZyBy
YXRoZXIgdGhhbgogICBjaGFuZ2UgdG8ga2ZhaWwKIC0gQWRkZWQgRldGVCBwdGUtaHctYWQtdXBk
YXRpbmcgdGVzdHMKIC0gQWRkZWQgYSBjb3VwbGUgQ2zDqW1lbnQgdGFncwoKCkFuZHJldyBKb25l
cyAoMTEpOgogIHJpc2N2OiBzYmk6IERyb3AgZndmdCB1cHBlciBiaXRzIHRlc3QKICByaXNjdjog
c2JpOiBBZGQgZndmdCBwdGVfaHdfYWRfdXBkYXRpbmcgdGVzdAogIHJpc2N2OiBzYmk6IEVuc3Vy
ZSB3ZSBoYXZlIElQSXMgZW5hYmxlZCBmb3IgSFNNIHN1c3BlbmQgdGVzdHMKICByaXNjdjogc2Jp
OiBFbnN1cmUgU1VTUCB0ZXN0IGdldHMgYW4gaW50ZXJydXB0CiAgcmlzY3Y6IHNiaTogSW1wcm92
ZSBzdXNwIGV4cGVjdGVkIGVycm9yIG91dHB1dAogIHJpc2N2OiBzYmk6IEltcHJvdmUgaW50ZXJy
dXB0IGhhbmRsaW5nIGNsZWFudXAKICBsaWIvY3B1bWFzazogQWRkIHNvbWUgb3BlcmF0b3JzCiAg
cmlzY3Y6IHNiaTogSFNNIHN1c3BlbmQgbWF5IG5vdCBiZSBzdXBwb3J0ZWQKICByaXNjdjogc2Jp
OiBQcm9iZS9za2lwIFNVU1AKICByaXNjdjogc2JpOiBzdXNwOiBDaGVjayB1cHBlciBiaXRzIG9m
IHNsZWVwX3R5cGUgYXJlIGlnbm9yZWQKICByaXNjdjogc2JpOiBBZGQgYmFkIGZpZCB0ZXN0cwoK
IGxpYi9jcHVtYXNrLmggICAgIHwgIDU2ICsrKysrKysrKwogcmlzY3Yvc2JpLWZ3ZnQuYyAgfCAx
ODcgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIHJpc2N2L3NiaS10ZXN0cy5oIHwgICA0
ICsKIHJpc2N2L3NiaS5jICAgICAgIHwgMjkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDQyIGluc2VydGlvbnMoKyksIDk3
IGRlbGV0aW9ucygtKQoKLS0gCjIuNDguMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
