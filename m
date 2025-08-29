Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7077CA1005
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q2IGY8ok7ZQXhm+OHX+S5hxcZogEg1d+IM6GKVvRyqQ=; b=YOCYS8KYRWOXIc
	PbTP6o6wzdfELnDA+pYE1Huaf1fgQVQ/xykBnnVOHxb0JuzL5LyVtDlTdThmNLD8sDhLBhv8Jn4DP
	k7jWVS1+9pvXOtv5F4aD+RbjKyfXvVFfnD7zM1uDWPv6CH23XWI9vRVG4mQlr3RAcYS6b5LSCe6sA
	TEEtje5qcTp3sIYO1MT0FbRqA4ErfRmCPcdau+1CnaUOdbHaY+Pd05YxxWj41KbZz18gXbv4YXr9p
	2JL5wXed5+ljw80B9qVPvm3NvYItZAUj0bO9LWgEqxNSgKgzMFfSIQ8bzYnvHPfVUx1pvfaZJDkTd
	e4zltOGlsvbhNwsWgY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1GO-00000006Fbt-2q2d;
	Fri, 29 Aug 2025 15:43:40 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxp2-00000005aKY-3SVL
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 12:03:14 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3f0651cb8aeso17025505ab.3
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756468991; x=1757073791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYNFutfh++jtwXbKK5NcgiM2+AZs+kWzua2N3lwLnEY=;
        b=mtvU21+BAPQbABXqfJddTPZBDzvCziOQ4UOoxgzR6Mp0b3oC7bN9jeFDR2giGyO5GJ
         ZmKoZiLgmylWLLEkSwy8nJTzAa8nB6/1aK+aSbhSOCI5/rvP5EnzNOopewp17FBkTUg5
         lTuDDm5GN81AOQTRnVtJjK1ZYCpLurDysi6KmyPXHIseu5j/Qo2TxLjlhcGfBiQh7sXq
         qtazZ5MeEnFDALnG4qsUPocDwdjFqqTWx0SKehAZ+QOuiL2rNKaUKsRBdFJ7/4aKeXrh
         Z1cozbDEYTbdDm5f/22ou7wemOtd+VgdprCrV4TjwLsNjoBoXwr6Qk/ichwx8TifHUGK
         pJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468991; x=1757073791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYNFutfh++jtwXbKK5NcgiM2+AZs+kWzua2N3lwLnEY=;
        b=sEJSuCYQwqkcbaBhUK2Os++yG+VbjJ0hkppk3pEPGq7vtmegeC9g3PljFSKLDRjpLz
         FF18duO2UfNbwIbb1aFiDnOyuPetRVNL0S13z7XBQONFgWHBwewOiOV0p66FWZesCn4x
         gu8v66nzJ6CERtmWD8M5f/RpwE9yjvLDJD0Y0cWMRvYeH7s7nYg2lDe5E6Qx1aVAYoGv
         QtZdNM8Z0cWL8EndBDLBhjwr6VMIagw/uzl1H/GVsTs9Cz8p0JYAgvgCZPraYrg7FJ2w
         jOA6BQSCXXaXFZ4xqPuBKM4iA1Vzu9y4k3sKYJuXc4pqM8qcHqkZOlknhsfSkft9BVT+
         OTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxxXEiqtpAf5Qh7dpgvxmDySH5GD2nOShOKaunDsRXXS3kL20H9FoIzv6QRnkuQCq147VmGtlEDz8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlTVfhBBsL65eE5k5Hs47MYMfX44yHfQQ+XlSJKvkk1ABhFV3k
	St3MVyoZSr2q2jq0klPiWJU4cEuBuqcOnWptdtSIFciq9hDih8QzTAE0w79aSnJTSeke72qa+HL
	SQ6ZX4rsg1+qVvwhDVxJ++s91Cr7YzrFsCKypINkMog==
X-Gm-Gg: ASbGnctBl6KL5DdOoks01qFd2COhshy650iOyOqqHny70a/6aHugq25TRnAn5pClNsG
	ruHHfFxQAzIoTrhr3XIHkPOIX6ys8/qnMVf+rHsMARA99Xoso/qMxydhkKgL5bTST4lchn7lgvV
	1yIvtGQLGndVDAo1kT2djTAGbqoYQygCQNvAYsdPq56LO7M+o1zmHi6Ccx2q71bfb8yC+6osYx6
	2OuvekApPy4edCapNtGTujjYailVQiyImq0wnoxxOcSBMWjg+8=
X-Google-Smtp-Source: AGHT+IFXsAoUNLkdTWWs+sGF85vxiFHbYT3ArWNVeedfUfoSfqzjbXKy27En0OAYFF2XHtzCHU8/JEzYpKZ8RSq7cV4=
X-Received: by 2002:a05:6e02:3781:b0:3f2:3b7d:58fd with SMTP id
 e9e14a558f8ab-3f23b7d5caamr71228615ab.2.1756468991131; Fri, 29 Aug 2025
 05:03:11 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Aug 2025 17:32:58 +0530
X-Gm-Features: Ac12FXy9Q2PA7eHhvU1GhQ7yjn4SuUQfNFmkh0YnStroRXWqxGkWkkjID8r9Y5I
Message-ID: <CAAhSdy0c5tScwHk8iLoF39dxFUSLg1RzST9=4EQ3C8KogvbM6w@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.17 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_050312_998550_AD4C073C 
X-CRM114-Status: UNSURE (   8.00  )
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

SGkgUGFvbG8sCgpXZSBoYXZlIHRocmVlIGZpeGVzIGZvciB0aGUgNi4xNyBrZXJuZWwuIFR3byBv
ZiB0aGVzZSBhcmUKY3JpdGljYWwgZml4ZXMgaW4ga3ZtX3Jpc2N2X2dzdGFnZV9pb3JlbWFwKCkg
YW5kIHNldHRpbmcKdmxlbmIgdmlhIE9ORV9SRUcgd2hlcmVhcyB0aGUgdGhpcmQgb25lIGlzIGEg
dHJpdmlhbCBmaXgKaW4gY29tbWVudHMgb2Yga3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHMo
KS4KClBsZWFzZSBwdWxsLgoKUmVnYXJkcywKQW51cAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCAxYjIzN2YxOTBlYjNkMzZmNTJkZmZlMDdhNDBiNWViMjEwMjgwZTAwOgoKICBM
aW51eCA2LjE3LXJjMyAoMjAyNS0wOC0yNCAxMjowNDoxMiAtMDQwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2
L2xpbnV4LmdpdCB0YWdzL2t2bS1yaXNjdi1maXhlcy02LjE3LTEKCmZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0byA3OTk3NjYyMDhmMDlmOTU2NzdhOWFiMTExYjkzODcyZDQxNGZiYWQ3OgoK
ICBSSVNDLVY6IEtWTTogZml4IHN0YWNrIG92ZXJydW4gd2hlbiBsb2FkaW5nIHZsZW5iICgyMDI1
LTA4LTI1IDEwOjI2OjIwICswNTMwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpLVk0vcmlzY3YgZml4ZXMgZm9yIDYuMTcs
IHRha2UgIzEKCi0gRml4IHB0ZSBzZXR0aW5ncyB3aXRoaW4ga3ZtX3Jpc2N2X2dzdGFnZV9pb3Jl
bWFwKCkKLSBGaXggY29tbWVudHMgaW4ga3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHMoKQot
IEZpeCBzdGFjayBvdmVycnVuIHdoZW4gc2V0dGluZyB2bGVuYiB2aWEgT05FX1JFRwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpGYW5neXUgWXUgKDEpOgogICAgICBSSVNDLVY6IEtWTTogRml4IHB0ZSBzZXR0aW5ncyB3aXRo
aW4ga3ZtX3Jpc2N2X2dzdGFnZV9pb3JlbWFwKCkKClF1YW4gWmhvdSAoMSk6CiAgICAgIFJJU0Mt
VjogS1ZNOiBDb3JyZWN0IGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVlc3RzKCkgY29tbWVudAoK
UmFkaW0gS3LEjW3DocWZICgxKToKICAgICAgUklTQy1WOiBLVk06IGZpeCBzdGFjayBvdmVycnVu
IHdoZW4gbG9hZGluZyB2bGVuYgoKIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAgfCA1ICsr
KystCiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgIHwgMiArLQogYXJjaC9yaXNjdi9rdm0v
dmNwdV92ZWN0b3IuYyB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
