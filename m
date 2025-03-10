Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F321C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YipELAsfgruIWbIZQgUyMJDpJWHgv6kH0m1eg8/0pk=; b=jeD66wR/f6pzzm
	VPXdSln9Ewc8QthP3JJN2bASuiZnM0qBmK5nnCq68sq/G+Q91QdRhXL8qrtXa79fcfSNXwPO2UIxV
	Nw55XEKx5b/NdBJ+wx1sVb5TfTDbHAetOySpzWgA2i2jLiCN39BVUzl//NFdlOG/S8g7pqcuPL5c5
	9v7afR+eAumNceYFnIWMOoOa5gOifpiz0wok23r597GQsEUpOI5tB7n12mkKE7uOVJYfXcLeO2Z8H
	0bcx2MJI1/xZK6vzBoWazS3ipDRzsJ0w4TO9Qlj96lb4gPyfW0/s4zfcy1hU3h96oMTj7p4vrkPkT
	YGytguDyoPCFpNl/otwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfM1-00000003G7j-3dTb;
	Mon, 10 Mar 2025 15:47:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trepX-000000037uT-2yp9
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-223a7065ff8so4776495ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619651; x=1742224451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=vzcM28pMTpXkhcHmcZMbN2IN45ck0WszXVk1M1epcpQo4mbTBXF8SUPZRoLusYJqwb
         6bIau4KoFN2xPqFtmAb4Rfljv5Rhlu8Cl2kcHSH4XnNljo+4tHysaacZuUFijadXUWW+
         fkMUbdwA4mapF3zhYWcmrxKlbnmsxb5SzCNtNdg7WkeUqGrZTFNaSBmOg/GGLLaR+p05
         4DqTypIeEy028tNiC0ub97pGyOpF+1kt7RxFBKOVL60eh5+ohVTLP4pFd/0rXS8QPdrO
         /R712on6+oMXgBGU5uX2oL1tdll5LAGI7xeqx0DOepYZ1TuJ9Is1fMktPDHwowKLU1Cz
         wuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619651; x=1742224451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=c5wSIuGHQgOnLNZSQuGOJnKbsLBqzy6afCHA0bwsKu06fFLTF07x6zyBmfHmCDi7Nc
         LIHsHWt+FdrLB/bLagKifHLzyGdKQuAEWjdu2T6HOzqYiJWSqIL5riPZf7BiRJC73Zd3
         fVxO/a74Lvfih76DwrjHG4cWHJ0g0e7v9Z5Rkgn15CmfnFH16qOs7MHBLueMuC8uwd38
         PCSwyF4YOQzdZE930V+9Vj3WWJwkyGw2U2+g2TmGXTDOgdVtuMOVRHnfg17/n4MvEDtX
         LsEquRJidqyo2Qi23zDeLBFiLastxtkb0Z57dHvC/p1UtFju+xFBZJOxoGiDUxxK2JnH
         NW+w==
X-Forwarded-Encrypted: i=1; AJvYcCUXabAF521UgD9LJznNTk1Z4KsQ0GmACSnL7F4Sqrz42HlMaxL7cTyILVkT3PLvpPgv3KNgInay6z4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKPcsAWJBgD8bPfna3lKoiXJw/E9v68cbZfZWIgQIDogWNrZ3O
	NJCUYgKtCnVehIRRJD7ByB+zh2BsOsbd6wxS/M5qILQEWtIhKdcEqCHQ1ktxnj8=
X-Gm-Gg: ASbGnctMZPJJJp4q8VyxyoJ6lMosW5se5v+tTk1C6mR4VIlqrwbhcTudxvx2+ZBqHhd
	B6kPttBlFxzXFwFY7PdPcX54LeHW3dVz8QVo8LOx6Pni7Y0kfSJNv78FkPUEdf0rS55WVnN11bM
	Qk9q2kghvKwt+6b33scrPcA/LygQfrVNNiTpG4VtFZ3OLWZi4jmQzV2aTKoz3RxjFTx2iLemea+
	7NdRFHs/mzrgPDA3E0ailEkwGOUHLfjAXfdCWaycoR8OYsXWIdDwSM9qe5qquLG9kH8Mljt7GsZ
	fSDheHIqdbD+lvMYNdhQ0lInMKOOhX8MZLTD1YvjckPtcw==
X-Google-Smtp-Source: AGHT+IFrDg0cMkxcg3xxzzqPCaOQUBTnQwFpZHXCVcuWzC1x8fPkcfYHuG4bXSCleAdszR5qGgJy/A==
X-Received: by 2002:a17:902:d54e:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-2242887b415mr253277735ad.1.1741619651099;
        Mon, 10 Mar 2025 08:14:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 10/17] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 10 Mar 2025 16:12:17 +0100
Message-ID: <20250310151229.2365992-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081411_742058_AFF006D6 
X-CRM114-Status: GOOD (  10.70  )
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

V2UgY2FuIHNhZmVseSByZWVuYWJsZSBJUlFzIGlmIHRoZXkgd2VyZSBlbmFibGVkIGluIHRoZSBw
cmV2aW91cwpjb250ZXh0LiBUaGlzIGFsbG93cyB0byBhY2Nlc3MgdXNlciBtZW1vcnkgdGhhdCBj
b3VsZCBwb3RlbnRpYWxseQp0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCmluZGV4IDU1ZDlmMzQ1MDM5OC4uM2VlY2MyYWRkYzQxIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
QEAgLTIwNiw2ICsyMDYsMTEgQEAgZW51bSBtaXNhbGlnbmVkX2FjY2Vzc190eXBlIHsKIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlIHR5cGUpCiB7CiAJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGly
cWVudHJ5X2VudGVyKHJlZ3MpOworCWJvb2wgZW5hYmxlX2lycXMgPSAhcmVnc19pcnFzX2Rpc2Fi
bGVkKHJlZ3MpOworCisJLyogRW5hYmxlIGludGVycnVwdHMgaWYgdGhleSB3ZXJlIGVuYWJsZWQg
aW4gdGhlIGludGVycnVwdGVkIGNvbnRleHQuICovCisJaWYgKGVuYWJsZV9pcnFzKQorCQlsb2Nh
bF9pcnFfZW5hYmxlKCk7CiAKIAlpZiAodHlwZSA9PSAgTUlTQUxJR05FRF9MT0FEKSB7CiAJCWlm
IChoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQpAQCAtMjE3LDYgKzIyMiw5IEBAIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlCiAJCQkJICAgICAgIk9vcHMgLSBzdG9yZSAob3IgQU1PKSBhZGRy
ZXNzIG1pc2FsaWduZWQiKTsKIAl9CiAKKwlpZiAoZW5hYmxlX2lycXMpCisJCWxvY2FsX2lycV9k
aXNhYmxlKCk7CisKIAlpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsKIH0KIAotLSAKMi40Ny4y
CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
