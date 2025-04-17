Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3665EC369D1
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPU6uLCpD0yzOC3SM5qlzNX0PanilN4sS16vPyUcItc=; b=bj8S0xaMNByDcR
	YYaFW+2qwmoiH6HiJB57PpuXl8BUtroCaqIJBCZkKwp/DqbW2Lr3Mh4nD20E/iROIpjw9OSGMZYjK
	MWSBARHnYAMhjf0aln1L0SOxn1cMQyojxAsq3FQR0YluePDThjmWVlr7kjQDCa7gwkTh3VLI4ccuB
	uNQxU+BXQwHGT7IS9OynbnQJKS0mQKuRt3mNpZDp1OKJYxEbTazJDYW7kdS3CJ0aRyLXkGC6u2Low
	8OBzX9r9CTdjirQvD/THjidzH9Lu79e9XJsz2JoZ1xKzMNlqocfQm+k5R1RJz4nb5B3B6/IKnLjT8
	LidQKaA2bJLkoBzp1dTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTZ-0000000CzHu-3H1n;
	Thu, 17 Apr 2025 12:36:17 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OJ5-0000000Cvs6-3VdO
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:25:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22423adf751so8202025ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892727; x=1745497527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KHThPTp9HBECdAqxs4JY6wN99GqOifsmOPr7rqjaok=;
        b=hpU+U5lwreyO38ryhi10FQ3BWgwOTywqAlaGyXxZmDCRAVQu1aDxvMwGsrxz9QaWL+
         eRp4NBc82ZSOz7yO8bDPW8xjgHjTAQ+vOqINUHIsM57L8EnPYM1OqfrE65GH0LWibLeN
         oBHZKg3fj3Rg8oAv4MR542tjb85knfUMoPEk6MXCZNTScCbnrKfGvhTlMTQ+/DFR+ecY
         t00BNA7xBhFG//Pgkug/ln1N44E14n2yuoR6lwHGoPko7pKKtxvKk2jRI0rV9p+zos2/
         c03foZfk2tg+tmERxM1GCBeXqBng9Pgnpy9Lv5dGPFyAiLq/l7cMEia5vv9b8+busshZ
         75gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892727; x=1745497527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KHThPTp9HBECdAqxs4JY6wN99GqOifsmOPr7rqjaok=;
        b=mW3sA6HHYoxByyydUdz/yiJWsSyo7SKyvcvLsxLwrr+Tfvyxl0+joEc+dxxevdnGXc
         i0oReeBXxOaBuDkO9w0LJ2IxEYsCVC/9pWKaNhxWh6X8TQCYZREGSlRPfVu2Uk7kCmXw
         6G0EgMDwGGNqTjEa3z5/Ox+2lUkOHd7gPClKzq6idQ2K5Qv9XlgR7vPAkXBrmIJ8ouTj
         MWoOhMV9t8FNeTF50Xix17zhr7sZLUSeAwwM1Z4BOEPql50ELTLQUQXTedvoviBZ9suj
         RfF3kdiH7Vh/KzVE2CvyKjznz+JVX09D7f+pRMLxGJtmAV/7VcfpGC2DQOa4WzJjL5br
         zJDw==
X-Forwarded-Encrypted: i=1; AJvYcCW9xdhwotH50Wf+yPJwmAfAJxZ5jm4PWzCmLU1MYPXejIP519GdmIjhP+cHwAKOr0PXAzz33imhnH0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCZDjHKvfcCw85vk7TqXqTHwsLCBzX9Py3GMSK8/IDIqVskoVD
	VfFILtvecbBaCFqCZpXndTP/bpx4VKny7aq3dE6UeUTrRe1p7eL+FbHeiK7vXJQ=
X-Gm-Gg: ASbGnctPZHJBSWtZ2wq2rZcOpVnmYRB0RANuz+W0ZlLvpWU+yB2IxC3qP1qMphVPPZs
	P2pDUvExu6flHQzi97WzFjYHRm7kZLNB5KekK14HlHoev2LIvUJpeUzwphMYauqNSaI4Bv45JpU
	x8Zq5CCt9Z5r9Ri/D7p9tK+d++fo3lwF53hLxDJAjUbF2kqeKyO8xI+tlGg/PovWjZVTM366Yzo
	zKfUjtsd2WV83wy0mUyRjnISWnM++/cchqdkzKTo/3f3CGuscYqgwf/ZqiNOe185CMZOwTDhKqi
	3yRoiqOhdVPjAGJJdk7ZwHe8P4p861HoQj3T90i4OA==
X-Google-Smtp-Source: AGHT+IEoqy/kqoORsS0UV+1ioB/JireEK12cMki3F6JIxzmrV6R0qu0Yn7V200b2nJAkaxmJUugsbg==
X-Received: by 2002:a17:903:1b26:b0:224:13a4:d62e with SMTP id d9443c01a7336-22c3597ec4bmr109539965ad.35.1744892727277;
        Thu, 17 Apr 2025 05:25:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:26 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 10/13] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Thu, 17 Apr 2025 14:19:57 +0200
Message-ID: <20250417122337.547969-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052527_883628_D06B348F 
X-CRM114-Status: GOOD (  13.38  )
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

VGhlIEZXRlQgU0JJIGV4dGVuc2lvbiB3aWxsIG5lZWQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUg
bWVtb3J5IGFuZCBkbwppbml0IHRpbWUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24uIEFkZCBhbiBp
bml0L2RlaW5pdCBjYWxsYmFja3MgdGhhdAphbGxvd3MgdG8gZG8gc28uCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgOSArKysrKysrKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHUu
YyAgICAgICAgICAgICAgICAgfCAgMiArKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAg
ICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDM3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAppbmRl
eCA0ZWQ2MjAzY2RkMzAuLmJjYjkwNzU3YjE0OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmkuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3NiaS5oCkBAIC00OSw2ICs0OSwxNCBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lv
biB7CiAKIAkvKiBFeHRlbnNpb24gc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24gKi8KIAl1bnNpZ25l
ZCBsb25nICgqcHJvYmUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisKKwkvKgorCSAqIEluaXQv
ZGVpbml0IGZ1bmN0aW9uIGNhbGxlZCBvbmNlIGR1cmluZyBWQ1BVIGluaXQvZGVzdHJveS4gVGhl
c2UKKwkgKiBtaWdodCBiZSB1c2UgaWYgdGhlIFNCSSBleHRlbnNpb25zIG5lZWQgdG8gYWxsb2Nh
dGUgb3IgZG8gc3BlY2lmaWMKKwkgKiBpbml0IHRpbWUgb25seSBjb25maWd1cmF0aW9uLgorCSAq
LworCWludCAoKmluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisJdm9pZCAoKmRlaW5pdCko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIH07CiAKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2Zv
cndhcmQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKQEAgLTY5
LDYgKzc3LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmt2bV92Y3B1
X3NiaV9maW5kX2V4dCgKIGJvb2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7CiBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxsKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7CiB2b2lkIGt2bV9yaXNj
dl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bV9yaXNjdl92
Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogaW50IGt2bV9yaXNjdl92
Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcg
cmVnX251bSwKIAkJCQkgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRleCA2MGQ2ODRj
NzZjNTguLjg3N2JjYzg1YzA2NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCisr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtMTg1LDYgKzE4NSw4IEBAIHZvaWQga3ZtX2Fy
Y2hfdmNwdV9wb3N0Y3JlYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAogdm9pZCBrdm1fYXJj
aF92Y3B1X2Rlc3Ryb3koc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogeworCWt2bV9yaXNjdl92Y3B1
X3NiaV9kZWluaXQodmNwdSk7CisKIAkvKiBDbGVhbnVwIFZDUFUgQUlBIGNvbnRleHQgKi8KIAlr
dm1fcmlzY3ZfdmNwdV9haWFfZGVpbml0KHZjcHUpOwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwppbmRleCBkMWM4M2E3
NzczNWUuLjMxMzlmMTcxYzIwZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
YworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCkBAIC01MDgsNSArNTA4LDMxIEBAIHZv
aWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQlzY29u
dGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0gZXh0LT5kZWZhdWx0X2Rpc2FibGVkID8KIAkJCQkJS1ZN
X1JJU0NWX1NCSV9FWFRfU1RBVFVTX0RJU0FCTEVEIDoKIAkJCQkJS1ZNX1JJU0NWX1NCSV9FWFRf
U1RBVFVTX0VOQUJMRUQ7CisKKwkJaWYgKGV4dC0+aW5pdCAmJiBleHQtPmluaXQodmNwdSkgIT0g
MCkKKwkJCXNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFU
VVNfVU5BVkFJTEFCTEU7CisJfQorfQorCit2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCAq
c2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29udGV4dDsKKwljb25zdCBzdHJ1Y3Qga3ZtX3Jp
c2N2X3NiaV9leHRlbnNpb25fZW50cnkgKmVudHJ5OworCWNvbnN0IHN0cnVjdCBrdm1fdmNwdV9z
YmlfZXh0ZW5zaW9uICpleHQ7CisJaW50IGlkeCwgaTsKKworCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKHNiaV9leHQpOyBpKyspIHsKKwkJZW50cnkgPSAmc2JpX2V4dFtpXTsKKwkJZXh0ID0g
ZW50cnktPmV4dF9wdHI7CisJCWlkeCA9IGVudHJ5LT5leHRfaWR4OworCisJCWlmIChpZHggPCAw
IHx8IGlkeCA+PSBBUlJBWV9TSVpFKHNjb250ZXh0LT5leHRfc3RhdHVzKSkKKwkJCWNvbnRpbnVl
OworCisJCWlmIChzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID09IEtWTV9SSVNDVl9TQklfRVhU
X1NUQVRVU19VTkFWQUlMQUJMRSB8fAorCQkgICAgIWV4dC0+ZGVpbml0KQorCQkJY29udGludWU7
CisKKwkJZXh0LT5kZWluaXQodmNwdSk7CiAJfQogfQotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
