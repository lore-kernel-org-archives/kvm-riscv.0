Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE08C02193
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b/5TWDgSjmsB8cupGT+OXCsn/tU0dQlguT8QnNnsdzM=; b=0dVsI+e6fxp0dl
	R2+elIh8O6XV27Vetk0IGe+81pb05ErLE8wQbAotHaDP94v9E6iZWW0L/nStDkwkC8yGvNeJeROjN
	8034tunb6UYLcvwrvUn7DilMLdZNEbsN3p3tclSiEPsMCpz7HQ3fV0eJ2KQzT7i/Tefbxep0TJriu
	H0322obr5BA2t65KZMg5OzxlHMcaLNLv2mGMveKDtzlBbFG2RzlTCcyrF2yiqUaZrArZsgF12bux0
	jPdlhtCfLSyTUXpFRCGeWlISPCAOh/P8HJjNFMYk+OtAPWRYsisNnQNO8Y6eUs9tM2TLlMvrTd3SV
	lQfHmM5Q4fhlrp6L0UlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmPZ-0000000522y-3phe;
	Tue, 28 Jan 2025 14:17:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmO8-000000051ld-3mbm
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 14:16:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436249df846so38301525e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jan 2025 06:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738073783; x=1738678583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=affeeBrgh4ORX38d2oGXA54lH/oPzlNyTsePW0I63Z4=;
        b=P2LeOYw7kGJbWQugZ7M6+7ZFEQx0+VOe2tv8hVVX118wfnLQJCJcIJohmg10Ooac5e
         bgcc9q8H7bc3wWB+tavv9DemFaJVVgMUYONskLoMxlROT3vvkynIZ6IhktatIWeeNxlC
         GU/73K6FOf1CW0M5PZ8hsJjKzuz7SgzzcErtZIL0zDrUu/ZKxxhGSsHawCVoc4RawXQw
         2LAuvFjuNQBQbcyg/3Ji8g33ypq1hgqWWRbk2WMAjZ79GNRenY46T3+vC9Op0fmkZVku
         moyjn3xkSOR3pCg7z3xVqpjN2p0+J4HITRLPPjzZ8tPKHTfi79ZkLVQBHI7W21TqbVz1
         qWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073783; x=1738678583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=affeeBrgh4ORX38d2oGXA54lH/oPzlNyTsePW0I63Z4=;
        b=dWArepd4vVtIJrZSGLH43PaSN72KsOoIZCWXK+Xq24/vAu95L8xtNFTP5YkzjMHLSW
         7l27iBFNv7XpNylLKV6z9+CHw0roirXUomtJa7Zxf4+vrbh9KdyjQQ2fV9qFeSmmmaq6
         aauCeEZ6An7Wyws5PdofnHHlYQtQg8IMz/4RyIw2q9p7ZnwWZywZYY67MWiQyU9vHhyo
         sDRCmg+6Tpq8Etwb/8JvC2hoxA6R+UAGkkFOzpR3zPDCMCO8Vhym3j5IfrzhVBPeWONS
         a4u3BT0Xg8/J7uXeVV78CjX9j/osr4kIy7AMvH92zIR0cbzVaBGa5drVUWZGHu1q8dQH
         JQFg==
X-Forwarded-Encrypted: i=1; AJvYcCXsME2Kld5XDNFpldTuAI8+SmSCO9MFlY5UFiJRk4NgYdllX9lDWlAYk/XnRLR0fsQBABiGHlMtx6k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKVT3EMA8oIcW6f1/7lcQDHrT/JHA4WyZvyNC/AjMVHRlvNeCj
	oFpfuai+EKbrTxicX1ZS/nmFgOzISautNWswkIni3PQ8wDwnfkCLH0UIc9mS6qk=
X-Gm-Gg: ASbGnctI+uBg82RsJaWuFB2RnFzW54vUPpwCCSsZOzdNtDDruXL/v6mIenyiGfdsryo
	3KENneNiOo6RMCP4X6Oen9bhDndm7api+FLzT99Lgrx0FXHI6P4jcoqg7SSm8ldwnN1Wf8Q0q9w
	0TpXSd4ZpsOv8yIC/ddNHngqB8q5RIBxp3DbZpu/9PJqTcmbVhIfrBEQpO1S8T35azzeaIKpLU/
	ZmprP5ErOgvp1MbO5DNW5Eds7rYJEKNVFKq8aN5W+lXCdGaQhxpp2WUJdri94oDVWc2UvheNI3d
	zJx79M89Q+tqnhO6
X-Google-Smtp-Source: AGHT+IHtVj6Pq44tPaAWtdP99xnUKZD6nDdtqS+LHs53TT7+RI454gvtIJUV4uw4jyVc1HKtWOIXhA==
X-Received: by 2002:adf:f402:0:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-38bf56628f0mr33487958f8f.13.1738073783085;
        Tue, 28 Jan 2025 06:16:23 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c402esm14435772f8f.97.2025.01.28.06.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 06:16:22 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v3 0/2] Add support for SBI FWFT extension testing
Date: Tue, 28 Jan 2025 15:15:40 +0100
Message-ID: <20250128141543.1338677-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_061625_146316_B3C4A703 
X-CRM114-Status: GOOD (  11.26  )
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

VGhpcyBzZXJpZXMgYWRkcyBhIG1pbmltYWwgc2V0IG9mIHRlc3RzIGZvciB0aGUgRldGVCBleHRl
bnNpb24uIFJlc2VydmVkCnJhbmdlIGFzIHdlbGwgYXMgbWlzYWxpZ25lZCBleGNlcHRpb24gZGVs
ZWdhdGlvbi4gQSBjb21taXQgY29taW5nIGZyb20KdGhlIFNTRSB0ZXN0cyBzZXJpZXMgaXMgYWxz
byBpbmNsdWRlZCBpbiB0aGlzIHNlcmllcyB0byBhZGQgLWRlcHMKbWFrZWZpbGUgbm90YXRpb24u
CgotLS0KClYzOgogLSBSZWJhc2Ugb24gdG9wIG9mIGFuZHJldy9yaXNjdi9zYmkKIC0gVXNlIHNi
aXJldF9yZXBvcnRfZXJyb3IoKQogLSBBZGQgaGVscGVycyBmb3IgTUlTQUxJR05FRF9FWENfREVM
RUcgZndmdCBzZXQvZ2V0CiAtIEFkZCBhIGNvbW1lbnQgb24gbWlzYWxpZ25lZCB0cmFwIGhhbmRs
aW5nCgpWMjoKIC0gQWRkZWQgZndmdF97Z2V0L3NldH1fcmF3KCkgdG8gdGVzdCBpbnZhbGlkID4g
MzIgYml0cyBpZHMKIC0gQWRkZWQgdGVzdCBmb3IgaW52YWxpZCBmbGFncy92YWx1ZSA+IDMyIGJp
dHMKIC0gQWRkZWQgdGVzdCBmb3IgbG9jayBmZWF0dXJlCiAtIFVzZSBhbmQgZW51bSBmb3IgRldG
VCBmdW5jdGlvbnMKIC0gUmVwbGFjZSBoYXJkY29kZWQgMSA8PCB3aXRoIEJJVCgpCiAtIEZpeCBm
d2Z0X2dldC9zZXQgcmV0dXJuIHZhbHVlCiAtIFNwbGl0IHNldC9nZXQgdGVzdHMgZm9yIHJlc2Vy
dmVkIHJhbmdlcwogLSBBZGRlZCBwdXNoL3BvcCB0byBhcmNoIC1jIG9wdGlvbgogLSBSZW1vdmUg
bGVmdG92ZXIgb2YgbWFudWFsIHByb2JpbmcgY29kZQoKQ2zDqW1lbnQgTMOpZ2VyICgyKToKICBy
aXNjdjogQWRkICItZGVwcyIgaGFuZGxpbmcgZm9yIHRlc3RzCiAgcmlzY3Y6IEFkZCB0ZXN0cyBm
b3IgU0JJIEZXRlQgZXh0ZW5zaW9uCgogcmlzY3YvTWFrZWZpbGUgICAgICB8ICAgOCArLQogbGli
L3Jpc2N2L2FzbS9zYmkuaCB8ICAzNCArKysrKysrKwogcmlzY3Yvc2JpLWZ3ZnQuYyAgICB8IDE5
MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogcmlzY3Yvc2Jp
LmMgICAgICAgICB8ICAgMyArCiA0IGZpbGVzIGNoYW5nZWQsIDIzMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2L3NiaS1md2Z0LmMKCi0tIAoy
LjQ3LjEKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
