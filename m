Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59EDC83F1A
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 06:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1BJY8+Q5HKhrzvrSNA2q12VOiVyOSKtTX4EyvrC0n8=; b=rgW6k7xidnuY21
	qdiEbd3sr9CRkh09tJNTHn6yo25hEGmV4USJoqTo3OlUS996yIbbgmlRBZIKHQBdIrX3oWs9BH0IH
	ZoT3XNBo7+jdgthrTN3kOfcctskPxpe97qEdylRH562AphmI7dthxZaMXAWy4GR3nqxswN62JWx3R
	l4IdAqCGPFuJQ1Qrn/P6MFaApC8ntL4vXHnvyn3n2ZTQC3OdnrvBmZPC5O+I0kyj2TyuwPmLyfHx6
	gYor2wJWOA6SRNB00xnYqJvwecN0UmrgmxfD5rTfGi7oxvYPiVqso+1hnNbi/0nU8e3hr3nwP+B4Y
	hvoxeTCp/NqfjVGzdpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHr5-00000009Gel-2Ynz;
	Thu, 17 Jul 2025 06:12:31 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHr2-00000009GdX-27cl
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 06:12:29 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-875f28fde67so56729339f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 16 Jul 2025 23:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752732748; x=1753337548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uee3oli5059CdqjZMZ5JHaAC2Fn9BWMJg270zgvkJfM=;
        b=TtF5elnf1y2Xyd3HTD/GuHmvhG1xadW7sqjHI8tqvDoCzi69OOk2ME4vuB324K1xti
         bqQZdb6PoimMSbf1iLAML6jZxzYA1gu06lC2sfZp1ZOmlORmwVDZRJmHjSzmNSaBeRGs
         7Gj1uv8UdV71EQ/o7sSSoc0jYXTz0orWF9UHwgi0KDDzQVXwk1cOCtIYbWduTpVSD2Gb
         zF8nBndeKn/WTSC/Fj7pRC39rtv7jclEniphr59/z735QwHTy1sjMOxFcp4mmHQFSFB7
         O66lLMOC5piyfpzJbyHYAbikCaA6DoBiq5klPCqFxu7r9kqPJLy2AIbXxERuB0InntsU
         CR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732748; x=1753337548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uee3oli5059CdqjZMZ5JHaAC2Fn9BWMJg270zgvkJfM=;
        b=HoqVix/1T644i2mEmK/ppMWC45eFGGZ5hJoB60gOdtFi4IaYgP1LrrEwyR0lnnXBRj
         Io2uC/sJ98A6LUHV5kqqdO5ZXWN9hfck4MIHUOsoyqBAhvYEJjgmdGowVjG+tGRfn6Ro
         ziut79nmTqN+/XGm7nq//KZP2otj3yDmCF8GU5go0mZq8WXaw6F2/uepkE+oD4jG+inG
         XM1uaL21cJGQUvQn4qU6pZhWK8qKbfOoSlfPx6GaP7rdP78oFS3OZ8ZH4X2ZaA9P7JRk
         PlmHUOLXKq25ovnNXdnPNjlMmzAVXAnO5Y7hHP+8Jm7s3qf7tgkss83CVZ8UvSKG1Urf
         ZvBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKC/1GltpGFHusB7nifIWFjqH5M/mC4Lr6a+IlbSciofIzOOTAaHQ5Gqktwh1vQlds28UE4wBPsdE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv5pvcmEAjvrv0Fr+uZmceblydjRdrjBIyxFZm1fgev+v5HxUE
	2kDIQituTo/h33PDUUfHYJ7cbOnIbZAtYLa8YKoPgNR+kzDxFZhICJqpT0OynbwfUXcH4JABU5a
	09uBYKLPkyOUbb1qOEjmRMK89Zo7oahsfyzBGCXJAcQ==
X-Gm-Gg: ASbGncsRKBg9ZjnVG6GyXzEZTsKgDLNXLwZFt1QDp6KXzHlf0zmne12FKald/FuKaFF
	51+wEqn8983V3tJPQgtWz6vkXdTRXGiKbKBEPAz/9SRCIj5z7qo9CAHaFdk1x1SM7zRwiaX7zTV
	s9GDSGAkbY28OCJeqVKnOiQzzyrkATKsFexL2NQuy6VQEqpt1ThwGPpCdqK7m6/JkcZ2bSybSAp
	qzD9g==
X-Google-Smtp-Source: AGHT+IH8xcNIaMtG75XYnMN8W4vb5d0fFUQvseJHaY/XTWiJuHa1nEHEzpAjdB6OHrz4d8cQ5sLqYX8b9sjCFjfim50=
X-Received: by 2002:a05:6602:2d95:b0:875:b7b6:ae55 with SMTP id
 ca18e2360f4ac-879c08a1821mr619706139f.5.1752732747574; Wed, 16 Jul 2025
 23:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749810735.git.zhouquan@iscas.ac.cn> <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
In-Reply-To: <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 11:42:16 +0530
X-Gm-Features: Ac12FXxFyh1m_BsXZWN_jEHg_S_aVC3xq_tjAkTkzVkv4CVtzyvdpf1MklQXrzM
Message-ID: <CAAhSdy3aj_x02cpgxZDfn7tNu5HRfKA8VSZHpE1xJpY_2fABUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Add common supported test cases
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_231228_548621_0EB7A1BB 
X-CRM114-Status: GOOD (  14.27  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgNTowOOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gU29t
ZSBjb21tb24gS1ZNIHRlc3QgY2FzZXMgYXJlIHN1cHBvcnRlZCBvbiByaXNjdiBub3cgYXMgZm9s
bG93aW5nOgo+Cj4gICAgIGFjY2Vzc190cmFja2luZ19wZXJmX3Rlc3QKPiAgICAgZGVtYW5kX3Bh
Z2luZ190ZXN0Cj4gICAgIGRpcnR5X2xvZ19wZXJmX3Rlc3QKPiAgICAgZGlydHlfbG9nX3Rlc3QK
PiAgICAgZ3Vlc3RfcHJpbnRfdGVzdAo+ICAgICBrdm1fYmluYXJ5X3N0YXRzX3Rlc3QKPiAgICAg
a3ZtX2NyZWF0ZV9tYXhfdmNwdXMKPiAgICAga3ZtX3BhZ2VfdGFibGVfdGVzdAo+ICAgICBtZW1z
bG90X21vZGlmaWNhdGlvbl9zdHJlc3NfdGVzdAo+ICAgICBtZW1zbG90X3BlcmZfdGVzdAo+ICAg
ICByc2VxX3Rlc3QKPiAgICAgc2V0X21lbW9yeV9yZWdpb25fdGVzdAo+Cj4gQWRkIG1pc3Npbmcg
aGVhZGVycyBmb3IgdGVzdHMgYW5kIGZpeCBSSVNDVl9GRU5DRSByZWRlZmluaXRpb24KPiBpbiBg
cnNlcS1yaXNjdi5oYCBieSB1c2luZyB0aGUgZXhpc3RpbmcgbWFjcm8gZnJvbSA8YXNtL2ZlbmNl
Lmg+Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4K
ClBsZWFzZSBhZGRyZXNzIERyZXcncyBjb21tZW50cyBhbmQgc2VuZCB2MiBvZiBvbmx5IHRoaXMg
cGF0Y2guClRoZSBmaXJzdCBwYXRjaCBvZiB0aGlzIHNlcmllcyBpcyBhbHJlYWR5IHF1ZXVlZC4K
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtl
ZmlsZS5rdm0gICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysKPiAgLi4uL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICB8ICAyICsrCj4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNlcS1yaXNjdi5oICAgICAgICAgICAgfCAgMyArLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZS5rdm0gYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUua3ZtCj4gaW5kZXggMzhiOTU5OThlMWU2
Li41NjVlMTkxZTk5YzggMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L01ha2VmaWxlLmt2bQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmls
ZS5rdm0KPiBAQCAtMTk3LDYgKzE5NywxOCBAQCBURVNUX0dFTl9QUk9HU19yaXNjdiArPSBhcmNo
X3RpbWVyCj4gIFRFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGNvYWxlc2NlZF9pb190ZXN0Cj4gIFRF
U1RfR0VOX1BST0dTX3Jpc2N2ICs9IGdldC1yZWctbGlzdAo+ICBURVNUX0dFTl9QUk9HU19yaXNj
diArPSBzdGVhbF90aW1lCj4gK1RFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGFjY2Vzc190cmFja2lu
Z19wZXJmX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gZGVtYW5kX3BhZ2luZ190ZXN0
Cj4gK1RFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGRpcnR5X2xvZ19wZXJmX3Rlc3QKPiArVEVTVF9H
RU5fUFJPR1NfcmlzY3YgKz0gZGlydHlfbG9nX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3Yg
Kz0gZ3Vlc3RfcHJpbnRfdGVzdAo+ICtURVNUX0dFTl9QUk9HU19yaXNjdiArPSBrdm1fYmluYXJ5
X3N0YXRzX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0ga3ZtX2NyZWF0ZV9tYXhfdmNw
dXMKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0ga3ZtX3BhZ2VfdGFibGVfdGVzdAo+ICtURVNU
X0dFTl9QUk9HU19yaXNjdiArPSBtZW1zbG90X21vZGlmaWNhdGlvbl9zdHJlc3NfdGVzdAo+ICtU
RVNUX0dFTl9QUk9HU19yaXNjdiArPSBtZW1zbG90X3BlcmZfdGVzdAo+ICtURVNUX0dFTl9QUk9H
U19yaXNjdiArPSByc2VxX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gc2V0X21lbW9y
eV9yZWdpb25fdGVzdAo+Cj4gIFRFU1RfR0VOX1BST0dTX2xvb25nYXJjaCArPSBjb2FsZXNjZWRf
aW9fdGVzdAo+ICBURVNUX0dFTl9QUk9HU19sb29uZ2FyY2ggKz0gZGVtYW5kX3BhZ2luZ190ZXN0
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2
L3Byb2Nlc3Nvci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3Yv
cHJvY2Vzc29yLmgKPiBpbmRleCAxNjJmMzAzZDlkYWEuLjRjZjVhZTExNzYwZiAxMDA2NDQKPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3Iu
aAo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nl
c3Nvci5oCj4gQEAgLTksNyArOSw5IEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ICsjaW5jbHVkZSA8YXNtL3Zkc28vcHJvY2Vzc29y
Lmg+Cj4gICNpbmNsdWRlICJrdm1fdXRpbC5oIgo+ICsjaW5jbHVkZSAidWNhbGxfY29tbW9uLmgi
Cj4KPiAgI2RlZmluZSBJTlNOX09QQ09ERV9NQVNLICAgICAgIDB4MDA3Ywo+ICAjZGVmaW5lIElO
U05fT1BDT0RFX1NISUZUICAgICAgMgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9yc2VxL3JzZXEtcmlzY3YuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNl
cS1yaXNjdi5oCj4gaW5kZXggNjdkNTQ0YWFhOWEzLi4wNmM4NDBlODFjOGIgMTAwNjQ0Cj4gLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnNlcS9yc2VxLXJpc2N2LmgKPiArKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yc2VxL3JzZXEtcmlzY3YuaAo+IEBAIC04LDYgKzgsNyBAQAo+
ICAgKiBleGNlcHRpb24gd2hlbiBleGVjdXRlZCBpbiBhbGwgbW9kZXMuCj4gICAqLwo+ICAjaW5j
bHVkZSA8ZW5kaWFuLmg+Cj4gKyNpbmNsdWRlIDxhc20vZmVuY2UuaD4KPgo+ICAjaWYgZGVmaW5l
ZChfX0JZVEVfT1JERVIpID8gKF9fQllURV9PUkRFUiA9PSBfX0xJVFRMRV9FTkRJQU4pIDogZGVm
aW5lZChfX0xJVFRMRV9FTkRJQU4pCj4gICNkZWZpbmUgUlNFUV9TSUcgICAweGYxNDAxMDczICAv
KiBjc3JyIG1oYXJ0aWQsIHgwICovCj4gQEAgLTI0LDggKzI1LDYgQEAKPiAgI2RlZmluZSBSRUdf
TCAgX19SRUdfU0VMKCJsZCAiLCAibHcgIikKPiAgI2RlZmluZSBSRUdfUyAgX19SRUdfU0VMKCJz
ZCAiLCAic3cgIikKPgo+IC0jZGVmaW5lIFJJU0NWX0ZFTkNFKHAsIHMpIFwKPiAtICAgICAgIF9f
YXNtX18gX192b2xhdGlsZV9fICgiZmVuY2UgIiAjcCAiLCIgI3MgOiA6IDogIm1lbW9yeSIpCj4g
ICNkZWZpbmUgcnNlcV9zbXBfbWIoKSAgUklTQ1ZfRkVOQ0UocncsIHJ3KQo+ICAjZGVmaW5lIHJz
ZXFfc21wX3JtYigpIFJJU0NWX0ZFTkNFKHIsIHIpCj4gICNkZWZpbmUgcnNlcV9zbXBfd21iKCkg
UklTQ1ZfRkVOQ0UodywgdykKPiAtLQo+IDIuMzQuMQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
