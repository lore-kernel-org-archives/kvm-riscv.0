Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F32C021A1
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWQRMocqO53aoM4CyYF5yPfeddF5efCu1Oxq12e2iSQ=; b=2Gq9oOK8ZtaTjB
	iH24qxz8P53skSKIHzydlLxQA9MkwaVmug1tayLv8H2IfvdJ8r991jX27CQil0boEqnG/iejvP6Rf
	aeJOcVFRa++4kQUYmcdUiQgn0RtxHbCkgCvd5mAe8HP9/yTHQLgQiop/lpvHREG0vdrLvurTOLPQI
	ihR5auN1bSA6EyPzSW3PeopOPWAPLGhXxvV80vlvdxakCTzezAc2jZskHNv7gdp6X3v0bV0vkNV9K
	KdNxdH1Eqnzu7i94qBux0Kb9/tJkZ53eAWD9b2izW5OqbaJYpEs4tJiNvDHNEXEVzPKgleUAnzmDZ
	GABvby5yPt4IcdA1C+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylW-00000004CIy-0NvV;
	Mon, 17 Feb 2025 10:54:18 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyUQ-000000048NB-1sqb
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:36:40 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3ce85545983so10950595ab.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739788597; x=1740393397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXuIrr0uZbsvb+1H4q1P/dQZuaUoc6czcr9gRmWyKlc=;
        b=zQhqWPn5e/cS3JUJpH5rqQ6BVnqQHKIDf+hyZMI4E9hopwKAv85Eb4nJj/8nfZaflb
         ar2UCVYLXmhytANwvNWD8eUzAk2j9TwQybJI2isAlRCEvRSOao5q82AJCD2r/sqeGiQX
         +KEH7iblNdJrBV6hpWjrVwD9arBgxTugH7Yxx2OQAMfu6vsOQ0drv1i9RTDXnIfqu99l
         GNVkCDeA9Tgpv1fhogE4aYyH14hUq+E4mhsLMYa1EZfiIpt0913QZ13rHnr3J4LaeUOr
         UV/DagUsvj5CJrSAa6hQuevECo4RWZcKTW+r6iaiUB8TXlXVcLjlRZDL731/c8zlr82S
         WJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788597; x=1740393397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXuIrr0uZbsvb+1H4q1P/dQZuaUoc6czcr9gRmWyKlc=;
        b=VcKpO2ziRM9q/yc1/Bs1fO2JFsx0Np5eJuNfYk3FR9a4UiJ7SXUoCzRSJKnxz7uiZN
         IFZKA0zSZ6FosvX6xbGRGjvXpjtceyo9nn11u80STmKVHVue/YOWIQH8nfYm7TVsyVXl
         1vGBFOy1BMCn/DtJoBlpEEvbbSEvQvGKT6Qn5zwEJxc2iDYFHGsoivlBbgcHrgLBg4gf
         cDV6NgrFNpKmcAFOBXnplCOvEt0YiFc1Q6hEWDWkQtxCKSq/eLGCDW69hPVbtneZ8mRx
         XyQlXGocNuXa78rEibs01jvMzT+Kr+XQxor0RsOs5mU+Ccd49ar0xM2sdDTsodz6+719
         YNRA==
X-Forwarded-Encrypted: i=1; AJvYcCWengwdI3eabyf7m0jG+I7MlFbaDcsW2zf1wCkLZOCN27gviatCcn9aO5fD74vsXD8BXtp0aqhWi7M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmSxjjfeQyN6W0YfxfrPr60BevwNLAVuDdZ3FF3dq9OXsqj10S
	qoCfei5YIwXh1JJMYIDZC+9bAEc4DjrFvRf0dM5AVKXaUOxlGyObN8PEW8vBsO4PZxjKXcMLmpg
	j+a5H70J8AMwxpyLuQ+G7YvPvTQmRefoR6YFlEQ==
X-Gm-Gg: ASbGncsJ0l0J8+lnbZXc1+mFAcJ+5B04b+cX3GWgH42qWGz3l+yYLBoZodhG9ePDwTz
	AQbpekMDMbm/JtoZ9kRBWImplfbh+CvkKkNX7CfmuVQZdJFXJBlNxfMJuackyjEgmfNPop2tblQ
	==
X-Google-Smtp-Source: AGHT+IEw269iT/y4krWNO0LRo2RLfVtDkGsMXcWgAorAmpNUQzvjAfq/Q6R4P+Rr0miTce5VQs94e89cnvKhqhjf5ic=
X-Received: by 2002:a05:6e02:184d:b0:3cf:b2ca:39b7 with SMTP id
 e9e14a558f8ab-3d281e294f4mr66755685ab.3.1739788597288; Mon, 17 Feb 2025
 02:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-8-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-8-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:06:26 +0530
X-Gm-Features: AWEUYZkeJbANn3o67oIBgEtVLiGAHW5hziZFAcMUSpUUnQ4RfYuy1apwMnNIRW0
Message-ID: <CAAhSdy14rpAPQcv0nuhZ6DRhABa38cBq3oB7y28X6Fe8_adCbw@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: KVM: Fix hart suspend status check
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_023638_743612_88CC91B0 
X-CRM114-Status: GOOD (  14.66  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gIk5vdCBzdG9wcGVkIiBtZWFucyBzdGFydGVkIG9y
IHN1c3BlbmRlZCBzbyB3ZSBuZWVkIHRvIGNoZWNrIGZvcgo+IGEgc2luZ2xlIHN0YXRlIGluIG9y
ZGVyIHRvIGhhdmUgYSBjaGFuY2UgdG8gY2hlY2sgZm9yIGVhY2ggc3RhdGUuCj4gQWxzbywgd2Ug
bmVlZCB0byB1c2UgdGFyZ2V0X3ZjcHUgd2hlbiBjaGVja2luZyBmb3IgdGhlIHN1c3BlbmQKPiBz
dGF0ZS4KPgo+IEZpeGVzOiA3NjNjOGJlZDhjMDUgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNC
SSBIU00gc3VzcGVuZCBjYWxsIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfaHNtLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfaHNtLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+IGluZGV4IGRjZTY2
N2Y0YjZhYi4uMTNhMzVlYjc3ZThlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2hzbS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMKPiBAQCAtNzks
MTIgKzc5LDEyIEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9oc21fdmNwdV9nZXRfc3RhdHVzKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIHRhcmdldF92Y3B1ID0ga3ZtX2dldF92Y3B1X2J5
X2lkKHZjcHUtPmt2bSwgdGFyZ2V0X3ZjcHVpZCk7Cj4gICAgICAgICBpZiAoIXRhcmdldF92Y3B1
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+IC0gICAg
ICAgaWYgKCFrdm1fcmlzY3ZfdmNwdV9zdG9wcGVkKHRhcmdldF92Y3B1KSkKPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIFNCSV9IU01fU1RBVEVfU1RBUlRFRDsKPiAtICAgICAgIGVsc2UgaWYgKHZj
cHUtPnN0YXQuZ2VuZXJpYy5ibG9ja2luZykKPiArICAgICAgIGlmIChrdm1fcmlzY3ZfdmNwdV9z
dG9wcGVkKHRhcmdldF92Y3B1KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9IU01fU1RB
VEVfU1RPUFBFRDsKPiArICAgICAgIGVsc2UgaWYgKHRhcmdldF92Y3B1LT5zdGF0LmdlbmVyaWMu
YmxvY2tpbmcpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfSFNNX1NUQVRFX1NVU1BFTkRF
RDsKPiAgICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9IU01fU1RBVEVf
U1RPUFBFRDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9IU01fU1RBVEVfU1RBUlRFRDsK
PiAgfQo+Cj4gIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfaHNtX2hhbmRsZXIoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+IC0tCj4gMi40OC4xCj4KCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
