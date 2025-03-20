Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCFBC28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 08:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CH4xotHZTFDAt0YI/EKaM2W4cpV3DctWBWbGwfR8NKk=; b=3BRMm7UcM4VkWh
	B95FGxNEuKlfwFfLGA7jifGZysNZCM2AqvETXNa0U/Up66dcFK/SUUN2Kc0uUFxZyirw5QHg99qo6
	WeiIWoF/jZXCAYxFhU0zeckcZ94C2JbmMU9fS7ChiUw6NpVraNecmi2vYx4LzSJKrc09KzpmGep3F
	yMZE+3+tftWZvw/Q9/KTs/XNmfvftRTKeLwr9lm5jnk6fWU9BH58vx+KZk4zV743Hv6ptJl53NX8Q
	O68Ealn8TWaqtO3AHsU9HdEtbUiEfXdi5JZvq4Kexx4XuNQ8CqbsQ53LqwS+VrrexyhjBcKKNwREs
	/pE8eFbGOeCJwv9pyCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAxR-0000000BUIY-0vcv;
	Thu, 20 Mar 2025 08:08:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAxN-0000000BUI3-2aHi
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 08:08:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-399744f74e9so233809f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Mar 2025 01:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742458127; x=1743062927; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGAKgWIQzN7mhK8heXs4xRroEsHz6MkpwwVFPikYiAg=;
        b=irCFkkxNLnWILlNfDt60pYAAtJdB5n9AozBGToN00FN7cPLcOZ5GR4ksYowQXxSav5
         ms68wvP3LHmOCVuz4rlvg+m44eSSbuz4TlyEKjF9Y8yMsQCUeJHQOSm5PiLS4rEOKkM2
         pgCSJp4nVxDfwfoJGSNfnA/LpvrvyIOh3p73NrwePB9Mw0KRuWf3xiJUvbhMIF32BZ7p
         L3Ccr3DUTW0JP4TL8D1gEmjnakStpiX6gIXk5cAsd7vcfhZR2SBSGFMbj5frU2MhU6Ql
         5kvySIr8gg9DI2jyVWjsCRp0t/SmgRT8QK+rs6wx2I2uZlElyNcnhmxuB6dETiZYrXWK
         lUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458127; x=1743062927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGAKgWIQzN7mhK8heXs4xRroEsHz6MkpwwVFPikYiAg=;
        b=ps2kyz57YhWBU+veA328TkdcrifnjVojNOi/6LeBq5c+gk2p+dIyETmjl+agJ0HkKT
         Zdblr3Q8pavuowY5OfR5QcbaFKjXg+lmjcId6J3GK+EEFQzG3racCEF8Oij6OFUEN1jd
         V4zOfNvHkcXqLF692FO3Flvp0Zubt9NdZjkLgPJXY+AwKCbiN7ZU+nCnJbKk6gFAm2At
         0U6BxSgJvIHAOOy55YR7vntsk96OVR2pf0RQ5H8Ig2jYKb+y2rSjh3SqUZlOM+ElYl5j
         vVIEb1pXaRSak3btDL5+3N85nBTgC84JmUh2JPxXJGGh5q6tHY9eFU9pOG/2r58wXhUH
         h80w==
X-Forwarded-Encrypted: i=1; AJvYcCVB7mIhn5jUmW6mPhDWVEIV3mhD0RaDS8kauQ1VEDT+bSO/IBK+LmeOV1iOHbZOJSCCDCL5gHX37gU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3WWvebOP9MhS/olVkCv3HVnjFv42H3WP3RacU7P3vXBPMtGqh
	OxmjtguCvBKZ5RSISAeJg96oODrj+EMkNCrUcE3cOZCudsiskeMsSoHKyL7SwbY=
X-Gm-Gg: ASbGncvlM8J6hfYEwB0MfsMa/dCSy7MYnPY2IS800TE6rQ+JG9X1HXDfEKH6Gs4krqT
	2QnuYifv+/LwIL+PxwMTzH5NbnDztP1OxrKfx9EqQKhPkXrv6QKoe48qPDvgf0CxdgrmiB6uXAw
	DPHkEVJutxLM61YTpxriiKuH4RXS1naDIvIXUc8HOL2oYn70pc9nkeSfo55DMFerKuHFVbnVIFg
	fNIW8ut94ll++l+vcPCZqMY1TumJv8l5KTfv5duS8GsyMcCJfbbFpHCVuywiKKZ02fcHAveZBT8
	Wk7bQOhvU8e0fVH+eNl3iVJVL9G3hZo7o1i4pJ2mUDG4o2/cg8n9oqe9WfSfShpCuWLlIitbI4r
	XJb33GnBbJJksxwc9e4UE2bNp
X-Google-Smtp-Source: AGHT+IFO2kWZwodNF9+UTjUaxD+kEKmEFL7dIK7jDW2tYf6wT2aK+g6kAPYQAXxXqaVOblJ04xdL4Q==
X-Received: by 2002:a5d:59af:0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-399739de3ecmr5477298f8f.32.1742458127332;
        Thu, 20 Mar 2025 01:08:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cbbc88f2sm23094574f8f.101.2025.03.20.01.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:08:46 -0700 (PDT)
Message-ID: <56d35d26-05f7-4c5a-a987-a5cafb39a8ef@rivosinc.com>
Date: Thu, 20 Mar 2025 09:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v11 4/8] lib: riscv: Add functions for
 version checking
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-5-cleger@rivosinc.com>
 <20250319-7ce04ed29661af987303b215@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250319-7ce04ed29661af987303b215@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_010849_921367_DAF8D8CB 
X-CRM114-Status: GOOD (  14.91  )
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

CgpPbiAxOS8wMy8yMDI1IDE4OjMxLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTcsIDIwMjUgYXQgMDU6NDY6NDlQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBW
ZXJzaW9uIGNoZWNraW5nIHdhcyBkb25lIHVzaW5nIHNvbWUgY3VzdG9tIGhhcmRjb2RlZCB2YWx1
ZXMsIGJhY2twb3J0IGEKPj4gZmV3IFNCSSBmdW5jdGlvbiBhbmQgZGVmaW5lcyBmcm9tIExpbnV4
IHRvIGRvIHRoYXQgY2xlYW5seS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGxpYi9yaXNjdi9hc20vc2JpLmggfCAx
NSArKysrKysrKysrKysrKysKPj4gIGxpYi9yaXNjdi9zYmkuYyAgICAgfCAgOSArKysrKysrLS0K
Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2xpYi9yaXNjdi9hc20vc2JpLmggYi9saWIvcmlzY3YvYXNtL3NiaS5o
Cj4+IGluZGV4IDJmNGQ5MWVmLi5lZTlkNmU1MCAxMDA2NDQKPj4gLS0tIGEvbGliL3Jpc2N2L2Fz
bS9zYmkuaAo+PiArKysgYi9saWIvcmlzY3YvYXNtL3NiaS5oCj4+IEBAIC0xOCw2ICsxOCwxMyBA
QAo+PiAgI2RlZmluZSBTQklfRVJSX0lPCQkJLTEzCj4+ICAjZGVmaW5lIFNCSV9FUlJfREVOSUVE
X0xPQ0tFRAkJLTE0Cj4+ICAKPj4gKy8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCj4+ICsj
ZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQJMjQKPj4gKyNkZWZpbmUgU0JJX1NQ
RUNfVkVSU0lPTl9NQUpPUl9NQVNLCTB4N2YKPj4gKyNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9N
SU5PUl9NQVNLCTB4ZmZmZmZmCj4+ICsjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFTSwkJKChT
QklfU1BFQ19WRVJTSU9OX01BSk9SX01BU0sgPDwgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElG
VCkgfCBcCj4+ICsJCQkJCVNCSV9TUEVDX1ZFUlNJT05fTUlOT1JfTUFTSykKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIG5lZWRzIG9uZSBtb3JlIHNwYWNlCj4+ICsK
Pj4gICNpZm5kZWYgX19BU1NFTUJMRVJfXwo+PiAgI2luY2x1ZGUgPGNwdW1hc2suaD4KPj4gIAo+
PiBAQCAtMTEwLDYgKzExNywxMyBAQCBzdHJ1Y3Qgc2JpcmV0IHsKPj4gIAlsb25nIHZhbHVlOwo+
PiAgfTsKPj4gIAo+PiArLyogTWFrZSBTQkkgdmVyc2lvbiAqLwo+IAo+IFVubmVjZXNzYXJ5IGNv
bW1lbnQsIGl0J3MgdGhlIHNhbWUgYXMgdGhlIGZ1bmN0aW9uIG5hbWUuCgpZZWFoIHRoYXQncyBh
IGNvcHkvcGFzdGUgZnJvbSBMaW51eCwgZGlkbid0IGNsZWFudXAuCgo+IAo+PiArc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIHNiaV9ta192ZXJzaW9uKHVuc2lnbmVkIGxvbmcgbWFqb3IsIHVu
c2lnbmVkIGxvbmcgbWlub3IpCj4+ICt7Cj4+ICsJcmV0dXJuICgobWFqb3IgJiBTQklfU1BFQ19W
RVJTSU9OX01BSk9SX01BU0spIDw8IFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQpCj4+ICsJ
CXwgKG1pbm9yICYgU0JJX1NQRUNfVkVSU0lPTl9NSU5PUl9NQVNLKTsKPj4gK30KPj4gKwo+PiAg
c3RydWN0IHNiaXJldCBzYmlfZWNhbGwoaW50IGV4dCwgaW50IGZpZCwgdW5zaWduZWQgbG9uZyBh
cmcwLAo+PiAgCQkJdW5zaWduZWQgbG9uZyBhcmcxLCB1bnNpZ25lZCBsb25nIGFyZzIsCj4+ICAJ
CQl1bnNpZ25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwKPj4gQEAgLTEyNCw2ICsx
MzgsNyBAQCBzdHJ1Y3Qgc2JpcmV0IHNiaV9zZW5kX2lwaV9jcHUoaW50IGNwdSk7Cj4+ICBzdHJ1
Y3Qgc2JpcmV0IHNiaV9zZW5kX2lwaV9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzayk7Cj4+
ICBzdHJ1Y3Qgc2JpcmV0IHNiaV9zZW5kX2lwaV9icm9hZGNhc3Qodm9pZCk7Cj4+ICBzdHJ1Y3Qg
c2JpcmV0IHNiaV9zZXRfdGltZXIodW5zaWduZWQgbG9uZyBzdGltZV92YWx1ZSk7Cj4+ICtzdHJ1
Y3Qgc2JpcmV0IHNiaV9nZXRfc3BlY192ZXJzaW9uKHZvaWQpOwo+PiAgbG9uZyBzYmlfcHJvYmUo
aW50IGV4dCk7Cj4+ICAKPj4gICNlbmRpZiAvKiAhX19BU1NFTUJMRVJfXyAqLwo+PiBkaWZmIC0t
Z2l0IGEvbGliL3Jpc2N2L3NiaS5jIGIvbGliL3Jpc2N2L3NiaS5jCj4+IGluZGV4IDAyZGQzMzhj
Li45ZDRlYjU0MSAxMDA2NDQKPj4gLS0tIGEvbGliL3Jpc2N2L3NiaS5jCj4+ICsrKyBiL2xpYi9y
aXNjdi9zYmkuYwo+PiBAQCAtMTA3LDEyICsxMDcsMTcgQEAgc3RydWN0IHNiaXJldCBzYmlfc2V0
X3RpbWVyKHVuc2lnbmVkIGxvbmcgc3RpbWVfdmFsdWUpCj4+ICAJcmV0dXJuIHNiaV9lY2FsbChT
QklfRVhUX1RJTUUsIFNCSV9FWFRfVElNRV9TRVRfVElNRVIsIHN0aW1lX3ZhbHVlLCAwLCAwLCAw
LCAwLCAwKTsKPj4gIH0KPj4gIAo+PiArc3RydWN0IHNiaXJldCBzYmlfZ2V0X3NwZWNfdmVyc2lv
bih2b2lkKQo+PiArewo+PiArCXJldHVybiBzYmlfZWNhbGwoU0JJX0VYVF9CQVNFLCBTQklfRVhU
X0JBU0VfR0VUX1NQRUNfVkVSU0lPTiwgMCwgMCwgMCwgMCwgMCwgMCk7Cj4+ICt9Cj4+ICsKPj4g
IGxvbmcgc2JpX3Byb2JlKGludCBleHQpCj4+ICB7Cj4+ICAJc3RydWN0IHNiaXJldCByZXQ7Cj4+
ICAKPj4gLQlyZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9CQVNFLCBTQklfRVhUX0JBU0VfR0VUX1NQ
RUNfVkVSU0lPTiwgMCwgMCwgMCwgMCwgMCwgMCk7Cj4+IC0JYXNzZXJ0KCFyZXQuZXJyb3IgJiYg
KHJldC52YWx1ZSAmIDB4N2ZmZmZmZmZ1bCkgPj0gMik7Cj4+ICsJcmV0ID0gc2JpX2dldF9zcGVj
X3ZlcnNpb24oKTsKPj4gKwlhc3NlcnQoIXJldC5lcnJvciAmJiAocmV0LnZhbHVlICYgU0JJX1NQ
RUNfVkVSU0lPTl9NQVNLKSA+PSBzYmlfbWtfdmVyc2lvbigwLCAyKSk7Cj4+ICAKPj4gIAlyZXQg
PSBzYmlfZWNhbGwoU0JJX0VYVF9CQVNFLCBTQklfRVhUX0JBU0VfUFJPQkVfRVhULCBleHQsIDAs
IDAsIDAsIDAsIDApOwo+PiAgCWFzc2VydCghcmV0LmVycm9yKTsKPj4gLS0gCj4+IDIuNDcuMgo+
Pgo+IAo+IEkgZml4ZWQgdGhvc2UgdHdvIHRoaW5ncyB1cCB3aGlsZSBhcHBseWluZy4KClRoYW5r
cyBBbmRyZXcsCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwoKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
