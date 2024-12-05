Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2703CE7716D
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzK5fhiiddcnSQjIeypzdaRmNsoCo5NJ0PfQDlQlXuE=; b=BjZGd6XqgczLXO
	cApHwnNxvV6yIn7yX9qHvDoweKHOICleG2zW3GBSb7EG/hqzCXhJNtmVdStM+uLLFuvr6fUgEO5wv
	7zaUXmIxeJoAj+ZEXswJgCS1L0DBkJ4a1wPVNHlY2vMS5gWZqT79DeAwDhTUOQbbYKFMN+vUIf501
	Mai/6EFuKQjyl1WscpC+Ukqq9Kg1RfISf2kXFnMmDR1c/9EvyiRvzzVEiXpJVjcuAHVD2PT7oFC7t
	oIa8P7U4nKp3dKi9FbeWrgaHCbdBR6Ds/WyMcc2XDJZ2lH5scPadPQr1frZL5xe8Rj7bRnXEP7n4b
	1s5AcNTIfAY5pLbHXilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ4DV-0000000EnAf-3qP3;
	Thu, 05 Dec 2024 05:15:57 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ4DS-0000000En92-3VbA
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 05:15:55 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-84386a6669bso20335039f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Dec 2024 21:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733375754; x=1733980554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7V0lsWfxHC0LAZr8Xkd+CrpVdY597bt0ZgXgQzf/e4=;
        b=wWtW1eD2RK+vvtEQ7j6hbIXRC82cR2HCEggUpyO1T7Q3XFmfAQ1GPhCtpzKHvjncNi
         EuxKB++LNMMZhbNifuqJv/zLX8nJiQHfnKB1lK5Mwg4EjJvCxJZh7uiokdG4nTJg1Eoy
         qSILIvShFpy1NJ0qskLpE3HJkqIJrdjaqk+QWcDFsZAUrhKSgr6T82xrJ8m1RZ/Zgt7+
         amBxgTx42NxI/Uhrda1jZtVdv4JpCU6e7hgWDuS9qg686ZY2BDkLRayL2JNgAf/vftJY
         joK3vNWSFzWle65S+q/dCz1KRFRHZxvGoP7zoFMtTQOkumB7Lqg0iPzjkG0oUXXMZYT8
         mnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733375754; x=1733980554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7V0lsWfxHC0LAZr8Xkd+CrpVdY597bt0ZgXgQzf/e4=;
        b=pLhf4cpHOV2AhjmaUxxryPk+Cy3Xh43DE9Uv4+aLzdX63ZjKDZEAiFQhDJmOHIQsPi
         dptNuHtId637n3SUw534sDPworeoKmmhw+vLUOKjAZLq8fsvj214oAu3YNZps0UnO3jL
         jpgyaOQSiTrdHSZDaF/pbEKJMmrXCMy3hReOK/struJ7OtlNxnJ9qbps660v0NgSg/b2
         e/DeX1k88YkAZqfIQVQ0XMLrjSAxQ90pjuSbe9UNcGwhuGsNclziJsc73vR6U7Udi0aM
         RFUomEfkejbQNwcXy3bCPrWtQHEOeSF31PcFlQw83VsDKAvKRG/vymX7rr+Le7uh6dw0
         sz/Q==
X-Gm-Message-State: AOJu0YxSGF8ZzUc2EqRrGLyEerYLonQZTNXuPimC8Frx5rsIxx92ht1o
	Z3cirZj2KrA+Gv2TrxDANaa9p6BXHICrRl9PWLmHEySxz8JcfmDLp6n/DQFumGJXnUM+I0CEZtx
	u5IvCZbecEY75u+s7Pt1CsX2iHw/ifdTj5aTDxQ==
X-Gm-Gg: ASbGncuPTq469WA8ge3V2SgpWwOGzBmqeTjp35z4fRUpPKHt74FvGgnVVP0qsqcZmAo
	edaa/6/E3hOlE3ndOCrvBV+lITgK7fg==
X-Google-Smtp-Source: AGHT+IEcPwnPHlD4+Fk6Xx/PPdhO4iT4WxklkN4FxbW1MSoRzdawNiN/Eyy1VA7u79hhOfRaPhFgnLfUfm3DvfTiW98=
X-Received: by 2002:a05:6602:29c8:b0:83b:5221:2a87 with SMTP id
 ca18e2360f4ac-8445b544fd6mr1428972239f.3.1733375753736; Wed, 04 Dec 2024
 21:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20241017074538.18867-4-ajones@ventanamicro.com> <20241017074538.18867-6-ajones@ventanamicro.com>
In-Reply-To: <20241017074538.18867-6-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Dec 2024 10:45:42 +0530
Message-ID: <CAAhSdy31p8H8sg1x45f_qooZ-qdTRG2AZcHoiCyyCkCsNhy1eg@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Add SBI SUSP to get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_211554_881483_C9BEF44A 
X-CRM114-Status: GOOD (  12.99  )
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

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMToxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gS1ZNIHN1cHBvcnRzIFNCSSBTVVNQLCBzbyBhZGQg
aXQgdG8gdGhlIGdldC1yZWctbGlzdCB0ZXN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCgo+IC0tLQo+ICB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCA2ICsrKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5j
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gaW5k
ZXggOGUzNGY3ZmE0NGU5Li43YzMzNTU2ZWQ1OWQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gQEAgLTEwOCw2ICsxMDgsNyBA
QCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NW
X1NCSV9FWFQgfCBLVk1fUkVHX1JJU0NWX1NCSV9TSU5HTEUgfCBLVk1fUklTQ1ZfU0JJX0VYVF9I
U006Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfU0JJX0VYVCB8IEtWTV9SRUdfUklTQ1Zf
U0JJX1NJTkdMRSB8IEtWTV9SSVNDVl9TQklfRVhUX1BNVToKPiAgICAgICAgIGNhc2UgS1ZNX1JF
R19SSVNDVl9TQklfRVhUIHwgS1ZNX1JFR19SSVNDVl9TQklfU0lOR0xFIHwgS1ZNX1JJU0NWX1NC
SV9FWFRfREJDTjoKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwgS1ZNX1JF
R19SSVNDVl9TQklfU0lOR0xFIHwgS1ZNX1JJU0NWX1NCSV9FWFRfU1VTUDoKPiAgICAgICAgIGNh
c2UgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwgS1ZNX1JFR19SSVNDVl9TQklfU0lOR0xFIHwgS1ZN
X1JJU0NWX1NCSV9FWFRfU1RBOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX1NCSV9FWFQg
fCBLVk1fUkVHX1JJU0NWX1NCSV9TSU5HTEUgfCBLVk1fUklTQ1ZfU0JJX0VYVF9FWFBFUklNRU5U
QUw6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfU0JJX0VYVCB8IEtWTV9SRUdfUklTQ1Zf
U0JJX1NJTkdMRSB8IEtWTV9SSVNDVl9TQklfRVhUX1ZFTkRPUjoKPiBAQCAtNTI3LDEwICs1Mjgs
MTEgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnNiaV9leHRfc2luZ2xlX2lkX3RvX3N0cihfX3U2NCBy
ZWdfb2ZmKQo+ICAgICAgICAgICAgICAgICBLVk1fU0JJX0VYVF9BUlIoS1ZNX1JJU0NWX1NCSV9F
WFRfU1JTVCksCj4gICAgICAgICAgICAgICAgIEtWTV9TQklfRVhUX0FSUihLVk1fUklTQ1ZfU0JJ
X0VYVF9IU00pLAo+ICAgICAgICAgICAgICAgICBLVk1fU0JJX0VYVF9BUlIoS1ZNX1JJU0NWX1NC
SV9FWFRfUE1VKSwKPiArICAgICAgICAgICAgICAgS1ZNX1NCSV9FWFRfQVJSKEtWTV9SSVNDVl9T
QklfRVhUX0RCQ04pLAo+ICsgICAgICAgICAgICAgICBLVk1fU0JJX0VYVF9BUlIoS1ZNX1JJU0NW
X1NCSV9FWFRfU1VTUCksCj4gICAgICAgICAgICAgICAgIEtWTV9TQklfRVhUX0FSUihLVk1fUklT
Q1ZfU0JJX0VYVF9TVEEpLAo+ICAgICAgICAgICAgICAgICBLVk1fU0JJX0VYVF9BUlIoS1ZNX1JJ
U0NWX1NCSV9FWFRfRVhQRVJJTUVOVEFMKSwKPiAgICAgICAgICAgICAgICAgS1ZNX1NCSV9FWFRf
QVJSKEtWTV9SSVNDVl9TQklfRVhUX1ZFTkRPUiksCj4gLSAgICAgICAgICAgICAgIEtWTV9TQklf
RVhUX0FSUihLVk1fUklTQ1ZfU0JJX0VYVF9EQkNOKSwKPiAgICAgICAgIH07Cj4KPiAgICAgICAg
IGlmIChyZWdfb2ZmID49IEFSUkFZX1NJWkUoa3ZtX3NiaV9leHRfcmVnX25hbWUpKQo+IEBAIC05
NDEsNiArOTQzLDcgQEAgS1ZNX1NCSV9FWFRfU1VCTElTVF9DT05GSUcoYmFzZSwgQkFTRSk7Cj4g
IEtWTV9TQklfRVhUX1NVQkxJU1RfQ09ORklHKHN0YSwgU1RBKTsKPiAgS1ZNX1NCSV9FWFRfU0lN
UExFX0NPTkZJRyhwbXUsIFBNVSk7Cj4gIEtWTV9TQklfRVhUX1NJTVBMRV9DT05GSUcoZGJjbiwg
REJDTik7Cj4gK0tWTV9TQklfRVhUX1NJTVBMRV9DT05GSUcoc3VzcCwgU1VTUCk7Cj4KPiAgS1ZN
X0lTQV9FWFRfU1VCTElTVF9DT05GSUcoYWlhLCBBSUEpOwo+ICBLVk1fSVNBX0VYVF9TVUJMSVNU
X0NPTkZJRyhmcF9mLCBGUF9GKTsKPiBAQCAtMTAwNSw2ICsxMDA4LDcgQEAgc3RydWN0IHZjcHVf
cmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewo+ICAgICAgICAgJmNvbmZpZ19zYmlfc3RhLAo+
ICAgICAgICAgJmNvbmZpZ19zYmlfcG11LAo+ICAgICAgICAgJmNvbmZpZ19zYmlfZGJjbiwKPiAr
ICAgICAgICZjb25maWdfc2JpX3N1c3AsCj4gICAgICAgICAmY29uZmlnX2FpYSwKPiAgICAgICAg
ICZjb25maWdfZnBfZiwKPiAgICAgICAgICZjb25maWdfZnBfZCwKPiAtLQo+IDIuNDYuMgo+Cgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
