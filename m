Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0C0D3CC95
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 01:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQBcmqSS/dDDQTArw9w1p0LxEXxOADkOTyY96fhQddg=; b=gQAzMcrXaR3h6U
	DQPlTQcNtcwETrlqXYscc33vyNtcilt9ZgPgmhqXqGWmiMSIjSh5N7DT+SiZ9nSKbffK3MuFVzPk5
	I+s2YDKAiTMjLebkQKkcvfFiU4ZkgVV1PQQauYccjPfK5E56XQDv44SrS1rSpyw/9LOb4Krb82+SF
	+leHiEJoGgkkRj1KVkd5kuXhwCqrM7TGgnd1H3Gq5fNQSzz1bamS90zycaHSnRi8kDMjC79cHftU2
	dNHISv9Zu/Mrq7Ii+Wv+KaTnivCbn5OPcoHVKwQ0qJds4/G09R5pjgI0ldAuyOnVVHu39Mnzl01Sy
	Pg9BXD0/o5DSRcUznXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBuA-0000000BLX7-2J4t;
	Thu, 15 Jan 2026 01:12:06 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBu6-0000000BLVP-2Sco
	for kvm-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 01:12:03 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-55999cc2a87so130029e0c.0
        for <kvm-riscv@lists.infradead.org>; Wed, 14 Jan 2026 17:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768439521; x=1769044321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUr1YpmXUWWfc7TvOLgzjWtFpZs3Z7OTVcw608ZR5w0=;
        b=dg6govHebG1gCneDY1saigj5q3yryOUN/4ixTY/fB+40S85e21IVN3B9+hVC4oLza0
         Po/U79l7qcHFozvL50CWdh7dRhM1oP1zudZEclGM+2dpqYGiLhrwwIb3W0N/0N/QVbGC
         Fvol/Qe1ZY9kMC2wjZdcf+6ruEyUQNQ6FD8fH2GHdc41BShbxyY0RFGIVYa+INFmsEC2
         hcKxR1NXTMvDn9AlxE99FFaKatoJhqdXvdNLlA7nAMqQaXqr/dAgtR1jhSc9dS7/v9N5
         OKFAPKFChodMW2CGnQCIL+Pim8Gr1pE0faCmiR3Bh62g63oQzYOIVng7qpqzpZ0zZ4Xy
         KueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768439521; x=1769044321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUr1YpmXUWWfc7TvOLgzjWtFpZs3Z7OTVcw608ZR5w0=;
        b=auGFQA4aR6nRjYD3hhKJPVB+0quhi3eZQLXrEOmODqtix86RwSzGIztH9NOBHfO0ma
         5nWpDIUW/F0sDaUtMIEEuv+VEQAHGSIT55BmbAKaEut+rt5N/cYIRFoxJ8Rgwnbz7PJr
         dCY6c17gSpjv52Wq7JgF8ztyoW8tQo5fdQAIOdRApT+HgCQnNPYEZbFi4Qg+0UFyOD51
         OiD4R8rYvlXhUIVxoc6gyhEU4EpBAGWQa2+EeYZco6151njAHOpUoWV/+OaFyxcU0/n2
         XCb/izcEuqqpwcMrxxMgWMSKUKNIqEK2QcEf8SZCZuzQIMRUO3X62wj2ZZ+Pm5zORurW
         H+dA==
X-Forwarded-Encrypted: i=1; AJvYcCWk5lS+2cVnuoJ9heXVEzcEcVMNrTX9z8Nd07+Xf8TkpVd/m/3MeVJSEXTxasH8P7kceNKTwgesYik=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsKQzcXe8IBCr5zzzMATYv9NaxoayEGEhA9jQeYaiMXDyebZaX
	NBvbKJZf6EV5Rp9kCj6EEFL8HkiYOxyk20yUVHvWekYuH+5sEh5pmRpIgh7T2zgQuKBC2wiYinB
	ceqNOODUrh5DF23qfhLtdUnPMI+CqPS0=
X-Gm-Gg: AY/fxX5QJr9kO4xP2myfYdoZ/KzgTb9WWxEXK4KERErdEzymu4nDBfwQpRtmfZ75dGU
	90jXdRsTcQZsiBkE1fCpH2X1yHbQsEWjyB3XmQWzmLlvtkD7dWpcobpNldbwEIV+qGInGAK6iqL
	4knSBq5w4f8xweRiPI8oN6hR3CVYhKtSFmLvA2Q1+KsafWiqsuZw5M4Ak6/9HMNLG/5QK2Na0W3
	+uNHrQRwS399YFSBFipCjpuD/sVmYAJwhGeNV0nqwm/60QEAHU0rcrlS53dIaZrq7s1LBHODA==
X-Received: by 2002:a05:6102:1611:b0:5ee:a55c:882 with SMTP id
 ada2fe7eead31-5f17f43d3bcmr2256437137.12.1768439521237; Wed, 14 Jan 2026
 17:12:01 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
 <20260104135938.524-3-naohiko.shimizu@gmail.com> <CAAhSdy2rH5Jt5t7zCRfFd5d1X7qG41QoUuWvKgwuKX=X3Wk6cA@mail.gmail.com>
In-Reply-To: <CAAhSdy2rH5Jt5t7zCRfFd5d1X7qG41QoUuWvKgwuKX=X3Wk6cA@mail.gmail.com>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Thu, 15 Jan 2026 10:11:52 +0900
X-Gm-Features: AZwV_Qh3_8WiK11p2oDu-jwTcTccWhocAbVxHWGZR4SGJ8O3cJg7N4AR5bNOlrk
Message-ID: <CAA7_YY_ej7+mSi+i0NpHNeHv=a5n5_eGkjBi8pu2u=8h0Opsbg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
To: Anup Patel <anup@brainfault.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_171202_626754_62A8A499 
X-CRM114-Status: GOOD (  20.58  )
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

VGhhbmsgeW91IHZlcnkgbXVjaCwgQW51cC4KSSBhcHByZWNpYXRlIHlvdXIgcmV2aWV3IGFuZCBx
dWV1aW5nIHRoaXMgYXMgZml4ZXMgZm9yIHY2LjE5LgoKTmFvaGlrbwoKCk9uIE1vbiwgSmFuIDUs
IDIwMjYgYXQgMTozMeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3Rl
Ogo+Cj4gT24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjMw4oCvUE0gTmFvaGlrbyBTaGltaXp1Cj4g
PG5hb2hpa28uc2hpbWl6dUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFJWMzIsIHVwZGF0
aW5nIHRoZSA2NC1iaXQgc3RpbWVjbXAgKG9yIHZzdGltZWNtcCkgQ1NSIHJlcXVpcmVzIHR3bwo+
ID4gc2VwYXJhdGUgMzItYml0IHdyaXRlcy4gQSByYWNlIGNvbmRpdGlvbiBleGlzdHMgaWYgdGhl
IHRpbWVyIHRyaWdnZXJzCj4gPiBkdXJpbmcgdGhlc2UgdHdvIHdyaXRlcy4KPiA+Cj4gPiBUaGUg
UklTQy1WIFByaXZpbGVnZWQgU3BlY2lmaWNhdGlvbiAoZS5nLiwgU2VjdGlvbiAzLjIuMSBmb3Ig
bXRpbWVjbXApCj4gPiByZWNvbW1lbmRzIGEgc3BlY2lmaWMgMy1zdGVwIHNlcXVlbmNlIHRvIGF2
b2lkIHNwdXJpb3VzIGludGVycnVwdHMKPiA+IHdoZW4gdXBkYXRpbmcgNjQtYml0IGNvbXBhcmlz
b24gcmVnaXN0ZXJzIG9uIDMyLWJpdCBzeXN0ZW1zOgo+ID4KPiA+IDEuIFNldCB0aGUgbG93LW9y
ZGVyIGJpdHMgKHN0aW1lY21wKSB0byBhbGwgb25lcyAoVUxPTkdfTUFYKS4KPiA+IDIuIFNldCB0
aGUgaGlnaC1vcmRlciBiaXRzIChzdGltZWNtcGgpIHRvIHRoZSBkZXNpcmVkIHZhbHVlLgo+ID4g
My4gU2V0IHRoZSBsb3ctb3JkZXIgYml0cyAoc3RpbWVjbXApIHRvIHRoZSBkZXNpcmVkIHZhbHVl
Lgo+ID4KPiA+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gd3JpdGVzIHRoZSBMU0IgZmlyc3Qgd2l0
aG91dCBlbnN1cmluZyBhIGZ1dHVyZQo+ID4gdmFsdWUsIHdoaWNoIG1heSBsZWFkIHRvIGEgdHJh
bnNpZW50IHN0YXRlIHdoZXJlIHRoZSA2NC1iaXQgY29tcGFyaXNvbgo+ID4gaXMgaW5jb3JyZWN0
bHkgZXZhbHVhdGVkIGFzICJleHBpcmVkIiBieSB0aGUgaGFyZHdhcmUuIFRoaXMgcmVzdWx0cyBp
bgo+ID4gc3B1cmlvdXMgdGltZXIgaW50ZXJydXB0cy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkb3B0
cyB0aGUgc3BlYy1yZWNvbW1lbmRlZCAzLXN0ZXAgc2VxdWVuY2UgdG8gZW5zdXJlIHRoZQo+ID4g
aW50ZXJtZWRpYXRlIDY0LWJpdCBzdGF0ZSBpcyBuZXZlciBzbWFsbGVyIHRoYW4gdGhlIGN1cnJl
bnQgdGltZS4KPiA+Cj4gPiBGaXhlczogOGY1Y2I0NGIxYmFlICgiUklTQy1WOiBLVk06IFN1cHBv
cnQgc3N0YyBleHRlbnNpb24iKQo+ID4gU2lnbmVkLW9mZi1ieTogTmFvaGlrbyBTaGltaXp1IDxu
YW9oaWtvLnNoaW1penVAZ21haWwuY29tPgo+Cj4gTEdUTS4KPgo+IFJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+Cj4gUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9y
IExpbnV4LTYuMTkuCj4KPiBUaGFua3MsCj4gQW51cAo+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3RpbWVyLmMgfCA2ICsrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfdGltZXIuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ID4gaW5kZXgg
ODVhNzI2MjExNWUxLi5mMzYyNDdlNGM3ODMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3RpbWVyLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ID4g
QEAgLTcyLDggKzcyLDkgQEAgc3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV90aW1lcl9jYW5jZWwo
c3RydWN0IGt2bV92Y3B1X3RpbWVyICp0KQo+ID4gIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVf
dXBkYXRlX3ZzdGltZWNtcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBuY3ljbGVzKQo+ID4g
IHsKPiA+ICAjaWYgZGVmaW5lZChDT05GSUdfMzJCSVQpCj4gPiAtICAgICAgIG5jc3Jfd3JpdGUo
Q1NSX1ZTVElNRUNNUCwgbmN5Y2xlcyAmIDB4RkZGRkZGRkYpOwo+ID4gKyAgICAgICBuY3NyX3dy
aXRlKENTUl9WU1RJTUVDTVAsICBVTE9OR19NQVgpOwo+ID4gICAgICAgICBuY3NyX3dyaXRlKENT
Ul9WU1RJTUVDTVBILCBuY3ljbGVzID4+IDMyKTsKPiA+ICsgICAgICAgbmNzcl93cml0ZShDU1Jf
VlNUSU1FQ01QLCAodTMyKW5jeWNsZXMpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgIG5jc3Jfd3Jp
dGUoQ1NSX1ZTVElNRUNNUCwgbmN5Y2xlcyk7Cj4gPiAgI2VuZGlmCj4gPiBAQCAtMzA3LDggKzMw
OCw5IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfdGltZXJfcmVzdG9yZShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4KPiA+ICAjaWYgZGVmaW5lZChD
T05GSUdfMzJCSVQpCj4gPiAtICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgKHUzMil0
LT5uZXh0X2N5Y2xlcyk7Cj4gPiArICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgVUxP
TkdfTUFYKTsKPiA+ICAgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1FQ01QSCwgKHUzMikodC0+
bmV4dF9jeWNsZXMgPj4gMzIpKTsKPiA+ICsgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1FQ01Q
LCAodTMyKSh0LT5uZXh0X2N5Y2xlcykpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgIG5jc3Jfd3Jp
dGUoQ1NSX1ZTVElNRUNNUCwgdC0+bmV4dF9jeWNsZXMpOwo+ID4gICNlbmRpZgo+ID4gLS0KPiA+
IDIuMzkuNQo+ID4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==
