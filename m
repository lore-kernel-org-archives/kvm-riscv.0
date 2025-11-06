Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70771CCF9F8
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zjd9eDW+JN6xxPX2ZcO9RWSx0WgBqfKNu1oN6x0bsjg=; b=x1aeYOXo08uUk8
	ddtbUlBX6gVVe7NOd4HSoHQDeJ6o292rKWd9tyLgESu2fWm8aQc0napVV9bTWlMfq8B4ir+nIGsme
	PWRvRek8ygXBynqlSnZ/yizpdmWZt/5f3tjRJWcf9U/L02DwMmohEueptWTT283IcdU3Oy6skmXxy
	+d1hfLHXjlVkzDvKxApEILMKZ1t+h1PU8fWp5DjlrEhGn4JKhGWXPFqt7LKfKlIlUHWyOKsYCoOCe
	BzGh2RzBxYhP2i2t0mCJANGiENoS22r7CPovwors07Uqg+SyfMsnbNSwwjHv1RTdlHpABCW7aCP6D
	fi892Ln4XLcHMY8MYIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtWf-0000000Ewcc-03dQ;
	Thu, 06 Nov 2025 06:31:17 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtWb-0000000Ewbp-3Jyh
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 06:31:14 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-4330d2ea04eso1881505ab.3
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Nov 2025 22:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762410673; x=1763015473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wsAqJo0NXbvMDfBjbCfB9v96+a4KboR1hex7uLJfTY=;
        b=cbnnF548j7FG2WUns56LwvkFsOFzEIw53LpFk7J9RUTb3mlx7baeqJpQcIfUrzFJC4
         GvT0x7QAc5vzxQ35XhQYfbUrTMcDDIiCMppfIeCk/q2B3LhtsNY09kvVNsPs9S6G6Tq7
         XsLxy+QUgAEe28dppRJyuwIrbX5l4GyJrX2SW3/mj279sOwMMOMGYTE5JDHaYy7iuTNp
         E6vfpulHf+AsGGwyCaYaMsKhPoDFlfZR0dmcEVRKRgBMkwtiL1wlNFnmV3QtUXnm8uqP
         WPo6e+5vqydFmnpKDz7yvEb3wa8JgKGXmHsv/hqNrr4yJyuDADMLdXyOnQrS4awVQj5z
         tosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762410673; x=1763015473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wsAqJo0NXbvMDfBjbCfB9v96+a4KboR1hex7uLJfTY=;
        b=uWsW9cgJ+4SjiYniGAZrobJf/2TCothXOc6babod5vWbjLaF6UNlRpKMGbG/9NdIuF
         eOT4HDEOOlmKFz4PAtpZ26AxgCXt6YWhbnlRFwf3Ui3r8fLR6KB09XdOelgm1wLxgAeH
         ArfdYV1q48KFYV0V/wzk0oJHCucRk1Q8q3xuhUzsSFh+D2ljnr5NfwtpuLpoQqT+jM9d
         6qGSq9/MYl/Jfqm2Ds/GhJf0ac6MrdH2qbBF+HSyElyZd7TjbVQucnhcT2MR6UFc1CvG
         1ihH5z8PP/DWQtnmjbJCdYGw7fvKGg9sKc6TlncLom2+RASdaUHNFQ3aLzlxeCAbkAe4
         A9yg==
X-Forwarded-Encrypted: i=1; AJvYcCWV13/eSOcJnOnRfnGb/30hKxBJ+1e/942U1I97iIeHum5z6KGKpA96FPQQF36V1sACaVyza9UeMbk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTFNB4L7vxWTB6S9Zf8hFNR/96n6ucDszfA7JPVhy68ux6xej5
	Dn6Qm9r0bv4DHbNB98lYO1WhIjTy5XkQTY7gBLxxEcduciB5w7H1xujSO3/TDBwYYHrxTpeqnqV
	nli3cpSBbtAoN7aRSb+yekHmfJaFVUK5OXQUUohJbSQ==
X-Gm-Gg: ASbGncvYdoqJ6fJasxW8tp2J3j25t8eV8zjgt71JnZ2tkRf6SSYaG5mM72Kt9zr6E1u
	D6auwYRQxCW9rOs7tmREk+i/fTwvSvWJB6jw7uEPnRyQITFfvLtGhvvbG9gAZ7LmTHa6cfc6BAx
	7J1Yu0m98utnGMZ9hYQGhiGjg4FUi3ZXz3XyfNLfyj7z4p1E6bvsRLb0ze5E2BnF/KVqHl4ksiZ
	SzRSP2pkU3+UrFEnlMMFB2kBqrVPr21Gnp/wZsiBgbjaMXtwWMwZSk2SLIK3J0BaP321wh0O+vq
	c5uq56M=
X-Google-Smtp-Source: AGHT+IE62i5hdnOw1tkRcQojVd9lPnQXpVgG5xN5CqCFTDG7bifDDZ9QHqo5x/eJro/G00X8hkfIC+3pZrHlhszwkJs=
X-Received: by 2002:a05:6e02:3087:b0:433:2fa2:a558 with SMTP id
 e9e14a558f8ab-43340789f0cmr86438485ab.9.1762410672706; Wed, 05 Nov 2025
 22:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20250918073927.403410-1-qiaozhe@iscas.ac.cn>
In-Reply-To: <20250918073927.403410-1-qiaozhe@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Nov 2025 12:01:01 +0530
X-Gm-Features: AWmQ_bnVS73erzCQONrC7p_TFgCPBgKI27B4YWN1vAUbG-ECAIYJMH0uCmATp_w
Message-ID: <CAAhSdy2asCgoU+2q2wTQVCMD+LvdQjhJSbKUc-yRaGqmHnQoLQ@mail.gmail.com>
Subject: Re: [PATCH] RISCV: KVM: Add support for userspace to suspend a vCPU
To: Zhe Qiao <qiaozhe@iscas.ac.cn>
Cc: atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_223113_879474_26A57212 
X-CRM114-Status: GOOD (  22.34  )
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

T24gVGh1LCBTZXAgMTgsIDIwMjUgYXQgMTowOeKAr1BNIFpoZSBRaWFvIDxxaWFvemhlQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IEFkZCBSSVNDLVYgYXJjaGl0ZWN0dXJlIHN1cHBvcnQgZm9yIHRo
ZSBLVk1fTVBfU1RBVEVfU1VTUEVOREVEIHZDUFUKPiBzdGF0ZSwgaW5kaWNhdGluZyB0aGF0IGEg
dkNQVSBpcyBpbiBzdXNwZW5kZWQgbW9kZS4gV2hpbGUgc3VzcGVuZGVkLAo+IHRoZSB2Q1BVIHdp
bGwgYmxvY2sgZXhlY3V0aW9uIHVudGlsIGEgd2FrZXVwIGV2ZW50IGlzIGRldGVjdGVkLgoKVGhl
cmUgaXMgbm8gY2xlYXIgdXNlLWNhc2Ugd2h5IEtWTSB1c2VyLXNwYWNlIHdvdWxkIHB1dCBhIFZD
UFUgaW4Kc3VzcGVuZGVkIHN0YXRlIHdoaWxlIGl0IGlzIHJ1bm5pbmcuCgo+Cj4gSW50cm9kdWNl
IGEgbmV3IHN5c3RlbSBldmVudCB0eXBlLCBLVk1fU1lTVEVNX0VWRU5UX1dBS0VVUCwgdG8gbm90
aWZ5CgpBcyB0aGUgbmFtZSBzdWdnZXN0cywgdGhlIEtWTV9TWVNURU1fRVZFTlRfV0FLRVVQIGlz
IGZvcgpzeXN0ZW0tbGV2ZWwgKG9yIHZtLWxldmVsKSB3YWtlLXVwIGFuZCBub3QgVkNQVS1sZXZl
bCB3YWtlLXVwLgoKPiB1c2Vyc3BhY2Ugd2hlbiBLVk0gaGFzIHJlY29nbml6ZWQgc3VjaCBhIHdh
a2V1cCBldmVudC4gSXQgaXMgdGhlbgo+IHVzZXJzcGFjZeKAmXMgcmVzcG9uc2liaWxpdHkgdG8g
ZWl0aGVyIG1ha2UgdGhlIHZDUFUgcnVubmFibGUgYWdhaW4gb3IKPiBrZWVwIGl0IHN1c3BlbmRl
ZCB1bnRpbCB0aGUgbmV4dCB3YWtldXAgZXZlbnQgb2NjdXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WmhlIFFpYW8gPHFpYW96aGVAaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCB8ICAyICsrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAg
ICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5k
ZXggZDcxZDMyOTlhMzM1Li5kYmM2MzkxNDA3YWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oCj4gQEAgLTQzLDYgKzQzLDggQEAKPiAgI2RlZmluZSBLVk1fUkVRX0hGRU5DRSAgICAg
ICAgICAgICAgICAgXAo+ICAgICAgICAgS1ZNX0FSQ0hfUkVRX0ZMQUdTKDUsIEtWTV9SRVFVRVNU
X1dBSVQgfCBLVk1fUkVRVUVTVF9OT19XQUtFVVApCj4gICNkZWZpbmUgS1ZNX1JFUV9TVEVBTF9V
UERBVEUgICAgICAgICAgIEtWTV9BUkNIX1JFUSg2KQo+ICsjZGVmaW5lIEtWTV9SRVFfU1VTUEVO
RCAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBLVk1fQVJDSF9SRVFfRkxBR1MoNywgS1ZNX1JF
UVVFU1RfV0FJVCB8IEtWTV9SRVFVRVNUX05PX1dBS0VVUCkKPgo+ICAjZGVmaW5lIF9fS1ZNX0hB
VkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCU19SQU5HRQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDNlYmNmZmZhYTk3
OC4uMDg4MWM3ODQ3NmIxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC00OTYsNiArNDk2LDE4IEBAIGludCBrdm1f
YXJjaF92Y3B1X2lvY3RsX2dldF9tcHN0YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAg
ICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc3VzcGVu
ZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArICAgICAgIFdSSVRFX09OQ0UodmNwdS0+
YXJjaC5tcF9zdGF0ZS5tcF9zdGF0ZSwgS1ZNX01QX1NUQVRFX1NVU1BFTkRFRCk7Cj4gKyAgICAg
ICBrdm1fbWFrZV9yZXF1ZXN0KEtWTV9SRVFfU1VTUEVORCwgdmNwdSk7Cj4gKyAgICAgICBrdm1f
dmNwdV9raWNrKHZjcHUpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9z
dXNwZW5kZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKyAgICAgICByZXR1cm4gUkVB
RF9PTkNFKHZjcHUtPmFyY2gubXBfc3RhdGUubXBfc3RhdGUpID09IEtWTV9NUF9TVEFURV9TVVNQ
RU5ERUQ7Cj4gK30KPiArCj4gIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9tcHN0YXRlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qga3ZtX21wX3N0YXRlICptcF9zdGF0ZSkKPiAgewo+IEBAIC01MTYsNiArNTI4LDkg
QEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X21wc3RhdGUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAo+ICAgICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gLUVJTlZBTDsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEtWTV9N
UF9TVEFURV9TVVNQRU5ERUQ6Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3N1c3Bl
bmQodmNwdSk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAg
ICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiAgICAgICAgIH0KPiBAQCAtNjgyLDYgKzY5
NywyNSBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAg
ICAgICAgIH0KPiAgfQo+Cj4gK3N0YXRpYyBpbnQga3ZtX3Jpc2N2X2hhbmRsZV9zdXNwZW5kKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgaWYgKCFrdm1fcmlzY3ZfdmNwdV9z
dXNwZW5kZWQodmNwdSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAxOwo+ICsKPiArICAgICAg
IGt2bV9yaXNjdl92Y3B1X3dmaSh2Y3B1KTsKPiArCj4gKyAgICAgICBrdm1fbWFrZV9yZXF1ZXN0
KEtWTV9SRVFfU1VTUEVORCwgdmNwdSk7Cj4gKwo+ICsgICAgICAgaWYgKGt2bV9hcmNoX3ZjcHVf
cnVubmFibGUodmNwdSkpIHsKPiArICAgICAgICAgICAgICAgbWVtc2V0KCZ2Y3B1LT5ydW4tPnN5
c3RlbV9ldmVudCwgMCwgc2l6ZW9mKHZjcHUtPnJ1bi0+c3lzdGVtX2V2ZW50KSk7Cj4gKyAgICAg
ICAgICAgICAgIHZjcHUtPnJ1bi0+c3lzdGVtX2V2ZW50LnR5cGUgPSBLVk1fU1lTVEVNX0VWRU5U
X1dBS0VVUDsKPiArICAgICAgICAgICAgICAgdmNwdS0+cnVuLT5leGl0X3JlYXNvbiA9IEtWTV9F
WElUX1NZU1RFTV9FVkVOVDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICB9
Cj4gKwo+ICsgICAgICAgcmV0dXJuIDE7Cj4gK30KPiArCj4gIC8qKgo+ICAgKiBrdm1fcmlzY3Zf
Y2hlY2tfdmNwdV9yZXF1ZXN0cyAtIGNoZWNrIGFuZCBoYW5kbGUgcGVuZGluZyB2Q1BVIHJlcXVl
c3RzCj4gICAqIEB2Y3B1OiAgICAgIHRoZSBWQ1BVIHBvaW50ZXIKPiBAQCAtNzMxLDYgKzc2NSw5
IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHMoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQo+ICAgICAgICAgICAgICAgICBpZiAoa3ZtX2NoZWNrX3JlcXVlc3QoS1ZNX1JF
UV9TVEVBTF9VUERBVEUsIHZjcHUpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNj
dl92Y3B1X3JlY29yZF9zdGVhbF90aW1lKHZjcHUpOwo+Cj4gKyAgICAgICAgICAgICAgIGlmIChr
dm1fY2hlY2tfcmVxdWVzdChLVk1fUkVRX1NVU1BFTkQsIHZjcHUpKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGt2bV9yaXNjdl9oYW5kbGVfc3VzcGVuZCh2Y3B1KTsKCldoeSBpZ25vcmUgdGhl
IHJldHVybiB2YWx1ZSBvZiBrdm1fcmlzY3ZfaGFuZGxlX3N1c3BlbmQoKSA/Cgo+ICsKPiAgICAg
ICAgICAgICAgICAgaWYgKGt2bV9kaXJ0eV9yaW5nX2NoZWNrX3JlcXVlc3QodmNwdSkpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjQzLjAK
PgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
