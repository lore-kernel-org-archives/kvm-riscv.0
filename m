Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F02CCA0FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmUIRZ24cEFrlXpb6E9vL7wE5cFGSREvU6fxF2jEKN8=; b=eAUAwsadnCM3DZ
	hwjUcXjdxaz2qUek9PBd7ptMRNj9bEait3uqVC134y5GlN2luGrrEsbf4EgetoXE2fJQoM1Dw7SNo
	1XK7qtyPZcigM0sWULsghLmlDrgsX3KaUnAF2GSUZd2KCPaVsQhqtaYPmw/8dtP6GYFLisV+/Jz20
	vQccXL/nqaydzfDf2k4I8AmA5LyJrFHNOWvGbIsf9xXD1KCX2ePlOIMuXRKlqkPPwW7/Yw2fMyXo6
	Xl/+oIOGmpqDuIe7yAeaZaLnUicA2v5dqZMrOoZjTfYr7uUQ5V+eLYPT4EV+FFZnFD7BrQNGZjZHb
	y+wS9GiwPmCAcvIrzeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsvB-00000005EEy-0Qqf;
	Tue, 09 Sep 2025 07:37:45 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsAv-00000004oF1-01bn
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 06:49:58 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-406ec5934caso10717755ab.3
        for <kvm-riscv@lists.infradead.org>; Mon, 08 Sep 2025 23:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757400595; x=1758005395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tMGMIIAM6sHy/Zxv5pxoK3ri8eUb3ls0915OVi+tjo=;
        b=NcSiIUhl2yz9t5g1g23quNpah6M5poSCxk08TqSXaKuby3zgPhdg8lPSpUe7q5Bw1D
         4b9VH4S9sX94HlTLUWidGqxUdI5w12IUhd+o76GOUehJMseRT084pPG5q2bgK7uqtpY7
         ypKMcVWKTOJh+keniaY/txgXoVROmOCGAGwXUxqaUbuRzk/ujpwkDs6rdvTZ23M1Acyo
         aK8wFfys5+tc0lgHI3SjUyqt0yGn8ucqwwl/rdxGr//XtjHbgn0vA82HVwzhNI39tneF
         Q6PKIV2fFpbUn7N8kgVngs5KyN9me0NVDN2Y7PiWGEmb71WCnBDmEmJT2TgRABgA9OkA
         pFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757400595; x=1758005395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tMGMIIAM6sHy/Zxv5pxoK3ri8eUb3ls0915OVi+tjo=;
        b=hEobs9U6xvJP108kg7q113y+fdN7tscGwkpl3DjDArS18ozmg+1n8jXblCMUPOme9u
         FRuTSIT0P5+g4zPb32A1OVtDVd2M1OwpKNnMPdvpvTZ0bqhG4diavoRxddZPfkEn5aOD
         o90mr3h3U64hTW3B8wuEMjc6ELy5FY0btwnN4T9Dxe6P6j59ha3g3VHOj9YlGMPS529y
         BD7oHVG5eUQOOWV3/X7MNWcmxQ31M8f7MSc5TalzUgF+FTn4bzH0MbHUei9PDHdF1USg
         c/Cim5QbNgHn91+HD0dFkYJ0Em7EWkdVVouvtqMV6afvBltO59fJc5imkFfQtVx6RVLj
         c0gw==
X-Forwarded-Encrypted: i=1; AJvYcCWfxItlJwKuSU/5v/g6OKDqW/KrVCaoG31yfQr24SbvqXUjWIv2IOITrfpOjP+nInBmY05rrtxEN9s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHFyuIMQKyo9WIdtIU4OSftuJg3Yrtfz8xAH+kba/xb3LOkoSy
	akun/XNtGGITRgnpcBJBv67Odc9IkPTPjWqnW55G4IEDJEIVaHaXVVgQO8YfZn7b/AAvUELRfRa
	jp41nIgXA0Y5U1VYSm8vdBX4Ztv/xNJt/eHFwo9w+3g==
X-Gm-Gg: ASbGncvSH4eICxq9vBdaF//cCkoe2buoUZzoow1ewKCa1KKpDJMLZ7DhT4HDk7zF/hz
	esoe7moZJkgQsWcSXq/rMPPcytD73wjh3nHxu8USl1Ee7MCHex4Wy1pbyRt+rzsuuyGoe79lNqT
	hbFXxT/geVtO3tEPtuaTpaNLYluTRqIP/KxDNtxbedNK0bXgWQC/8+RHggstBj5yzmZvsjC2RSr
	FVJP+3DNKI2PPuxihWoW+K5rVhuBbpcUEpBTLy1wZc1MTvjFwc=
X-Google-Smtp-Source: AGHT+IHApbelfKr9iZjlbPLT4hrwWMN2zK90Qp74CPK8qggzSmBY3zhKklG8kN1niPRcRUYYEKR1Dn+Se41EF7a7fAk=
X-Received: by 2002:a05:6e02:1a2e:b0:3f6:5f12:2905 with SMTP id
 e9e14a558f8ab-3fd8672ce38mr131687095ab.23.1757400595369; Mon, 08 Sep 2025
 23:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250825121411.86573-1-tjytimi@163.com>
In-Reply-To: <20250825121411.86573-1-tjytimi@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Sep 2025 12:19:43 +0530
X-Gm-Features: Ac12FXxC3F2KfRE7z4xEWUZppWNrpTWEFb52_Lgv63sTz9df23xVkubP9_GJqjA
Message-ID: <CAAhSdy27hnGS3HOazwnR4Y+SCk94RLnz5CA1kDkzsx7QH3dmwA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: skip csr restore if vcpu preempted reload
To: Jinyu Tang <tjytimi@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_234957_268775_E45BCAA3 
X-CRM114-Status: GOOD (  27.24  )
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgNTo0NOKAr1BNIEppbnl1IFRhbmcgPHRqeXRpbWlAMTYz
LmNvbT4gd3JvdGU6Cj4KPiBUaGUga3ZtX2FyY2hfdmNwdV9sb2FkKCkgZnVuY3Rpb24gaXMgY2Fs
bGVkIGluIHR3byBjYXNlcyBmb3IgcmlzY3Y6Cj4gMS4gV2hlbiBlbnRlcmluZyBLVk1fUlVOIGZy
b20gdXNlcnNwYWNlIGlvY3RsLgo+IDIuIFdoZW4gYSBwcmVlbXB0ZWQgVkNQVSBpcyBzY2hlZHVs
ZWQgYmFjay4KPgo+IEluIHRoZSBzZWNvbmQgY2FzZSwgaWYgbm8gb3RoZXIgS1ZNIFZDUFUgaGFz
IHJ1biBvbiB0aGlzIENQVSBzaW5jZSB0aGUKPiBjdXJyZW50IFZDUFUgd2FzIHByZWVtcHRlZCwg
dGhlIGd1ZXN0IENTUiAoaW5jbHVkaW5nIEFJQSBDU1JTIGFuZCBIR1RBUCkKPiB2YWx1ZXMgYXJl
IHN0aWxsIHZhbGlkIGluIHRoZSBoYXJkd2FyZSBhbmQgZG8gbm90IG5lZWQgdG8gYmUgcmVzdG9y
ZWQuCj4KPiBUaGlzIHBhdGNoIGlzIHRvIHNraXAgdGhlIENTUiB3cml0ZSBwYXRoIHdoZW46Cj4g
MS4gVGhlIFZDUFUgd2FzIHByZXZpb3VzbHkgcHJlZW1wdGVkCj4gKHZjcHUtPnNjaGVkdWxlZF9v
dXQgPT0gMSkuCj4gMi4gSXQgaXMgYmVpbmcgcmVsb2FkZWQgb24gdGhlIHNhbWUgcGh5c2ljYWwg
Q1BVCj4gKHZjcHUtPmFyY2gubGFzdF9leGl0X2NwdSA9PSBjcHUpLgo+IDMuIE5vIG90aGVyIEtW
TSBWQ1BVIGhhcyB1c2VkIHRoaXMgQ1BVIGluIHRoZSBtZWFudGltZQo+ICh2Y3B1ID09IF9fdGhp
c19jcHVfcmVhZChrdm1fZm9ybWVyX3ZjcHUpKS4KPgo+IFRoaXMgcmVkdWNlcyBtYW55IENTUiB3
cml0ZXMgd2l0aCBmcmVxdWVudCBwcmVlbXB0aW9uIG9uIHRoZSBzYW1lIENQVS4KCkN1cnJlbnRs
eSwgSSBzZWUgdGhlIGZvbGxvd2luZyBpc3N1ZXMgd2l0aCB0aGlzIHBhdGNoOgoKMSkgSXQncyBt
YWtpbmcgR3Vlc3QgdXNhZ2Ugb2YgSU1TSUMgVlMtZmlsZXMgb24gdGhlIFFFTVUgdmlydAogICAg
bWFjaGluZSB2ZXJ5IHVuc3RhYmxlIGFuZCBHdWVzdCBuZXZlciBib290cy4gSXQgY291bGQgYmUK
ICAgIHNvbWUgUUVNVSBpc3N1ZSBidXQgSSBkb24ndCB3YW50IHRvIGluY3JlYXNlIGluc3RhYmls
aXR5CiAgICBvbiBRRU1VIHNpbmNlIGl0IGlzIG91ciBwcmltYXJ5IGRldmVsb3BtZW50IHZlaGlj
bGUuCgoyKSBXZSBoYXZlIENTUnMgbGlrZSBoZWRlbGVnIHdoaWNoIGNhbiBiZSB1cGRhdGVkIGJ5
IEtWTQogICAgdXNlciBzcGFjZSB2aWEgc2V0X2d1ZXN0X2RlYnVnKCkgaW9jdGwuCgpUaGUgZGly
ZWN0aW9uIG9mIHRoZSBwYXRjaCBpcyBmaW5lIGJ1dCBpdCBpcyB2ZXJ5IGZyYWdpbGUgYXQgdGhl
IG1vbWVudC4KClJlZ2FyZHMsCkFudXAKCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDx0
anl0aW1pQDE2My5jb20+Cj4gUmV2aWV3ZWQtYnk6IE51dHR5IExpdSA8bnV0dHkubGl1QGhvdG1h
aWwuY29tPgo+IC0tLQo+ICB2MiAtPiB2MzoKPiAgdjIgd2FzIG1pc3NpbmcgYSBjcml0aWNhbCBj
aGVjayBiZWNhdXNlIEkgZ2VuZXJhdGVkIHRoZSBwYXRjaCBmcm9tIG15Cj4gIHdyb25nIChleHBl
cmltZW50YWwpIGJyYW5jaC4gVGhpcyBpcyBmaXhlZCBpbiB2My4gU29ycnkgZm9yIG15IHRyb3Vi
bGUuCj4KPiAgdjEgLT4gdjI6Cj4gIEFwcGx5IHRoZSBsb2dpYyB0byBhaWEgY3NyIGxvYWQuIFRo
YW5rcyBmb3IKPiAgQW5kcmV3IEpvbmVzJ3MgYWR2aWNlLgo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyB8IDEzICsrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggZjAwMWU1NjQwLi42NmJkM2RkZDUgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCj4gQEAgLTI1LDYgKzI1LDggQEAKPiAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRT
Cj4gICNpbmNsdWRlICJ0cmFjZS5oIgo+Cj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3Qg
a3ZtX3ZjcHUgKiwga3ZtX2Zvcm1lcl92Y3B1KTsKPiArCj4gIGNvbnN0IHN0cnVjdCBfa3ZtX3N0
YXRzX2Rlc2Mga3ZtX3ZjcHVfc3RhdHNfZGVzY1tdID0gewo+ICAgICAgICAgS1ZNX0dFTkVSSUNf
VkNQVV9TVEFUUygpLAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGVjYWxsX2V4
aXRfc3RhdCksCj4gQEAgLTU4MSw2ICs1ODMsMTAgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X2xvYWQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1
X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+ICAgICAgICAgc3RydWN0IGt2bV92
Y3B1X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+Cj4gKyAgICAgICBpZiAodmNwdS0+
c2NoZWR1bGVkX291dCAmJiB2Y3B1ID09IF9fdGhpc19jcHVfcmVhZChrdm1fZm9ybWVyX3ZjcHUp
ICYmCj4gKyAgICAgICAgICAgICAgIHZjcHUtPmFyY2gubGFzdF9leGl0X2NwdSA9PSBjcHUpCj4g
KyAgICAgICAgICAgICAgIGdvdG8gY3NyX3Jlc3RvcmVfZG9uZTsKPiArCj4gICAgICAgICBpZiAo
a3ZtX3Jpc2N2X25hY2xfc3luY19jc3JfYXZhaWxhYmxlKCkpIHsKPiAgICAgICAgICAgICAgICAg
bnNoID0gbmFjbF9zaG1lbSgpOwo+ICAgICAgICAgICAgICAgICBuYWNsX2Nzcl93cml0ZShuc2gs
IENTUl9WU1NUQVRVUywgY3NyLT52c3N0YXR1cyk7Cj4gQEAgLTYyNCw2ICs2MzAsOSBAQCB2b2lk
IGt2bV9hcmNoX3ZjcHVfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpCj4KPiAg
ICAgICAgIGt2bV9yaXNjdl9tbXVfdXBkYXRlX2hnYXRwKHZjcHUpOwo+Cj4gKyAgICAgICBrdm1f
cmlzY3ZfdmNwdV9haWFfbG9hZCh2Y3B1LCBjcHUpOwo+ICsKPiArY3NyX3Jlc3RvcmVfZG9uZToK
PiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Jlc3RvcmUodmNwdSk7Cj4KPiAgICAgICAg
IGt2bV9yaXNjdl92Y3B1X2hvc3RfZnBfc2F2ZSgmdmNwdS0+YXJjaC5ob3N0X2NvbnRleHQpOwo+
IEBAIC02MzMsOCArNjQyLDYgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X2xvYWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfZ3Vlc3RfdmVjdG9y
X3Jlc3RvcmUoJnZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guaXNhKTsKPgo+IC0gICAgICAga3Zt
X3Jpc2N2X3ZjcHVfYWlhX2xvYWQodmNwdSwgY3B1KTsKPiAtCj4gICAgICAgICBrdm1fbWFrZV9y
ZXF1ZXN0KEtWTV9SRVFfU1RFQUxfVVBEQVRFLCB2Y3B1KTsKPgo+ICAgICAgICAgdmNwdS0+Y3B1
ID0gY3B1Owo+IEBAIC02NDUsNiArNjUyLDggQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICB2b2lkICpuc2g7Cj4gICAgICAgICBzdHJ1Y3Qg
a3ZtX3ZjcHVfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9jc3I7Cj4KPiArICAgICAgIF9f
dGhpc19jcHVfd3JpdGUoa3ZtX2Zvcm1lcl92Y3B1LCB2Y3B1KTsKPiArCj4gICAgICAgICB2Y3B1
LT5jcHUgPSAtMTsKPgo+ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX3B1dCh2Y3B1KTsKPiAt
LQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
