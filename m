Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F359BE7718D
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1V1zeEJpP/VXaDBzhZG0XWm3/JmXoOtpssAEXKJmqwY=; b=CwUMz4lN8y2sU3
	9vnfhOIeTjKhaxTdPpD7GqMuc0xVS1oyFum+FbkT+LgeONW1vtgN0xoe+x5u0/bYUhBLyh3Hox+mi
	Z887N7kGSaVvZ1ms5KOWUahwcwuK2/nA/e/zWI3GAlUVP6jQC9bvTfg9myRk7KLapjknMYOxpnt9R
	A0kti0PeR6oX5WSkcdr75Gu4afxCQeWZv3reVhsZtSf+zoN7ur/PfH265YDAhMQa727stQfHghdCW
	jqvlHLBfZPCGpU77hZ7krfNHdDQxn+w2P2Ioq9iUFThaQoLvFXVtmznmXUOAdlcyZx2PY7GdxgtJQ
	xG0cNuG2uaZchV2TsDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPk0X-0000000AFe9-2Rb4;
	Mon, 23 Dec 2024 15:06:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPisV-0000000A5qu-3MYB
	for kvm-riscv@bombadil.infradead.org;
	Mon, 23 Dec 2024 13:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hnkagdjwjgNIPob+6WBvRRH+hXkhhZ41YnFLVb4sL9g=; b=o9iWF9U4MIQHWPm+QFvbplg7PF
	r6PrO+6SarPGZFFaUi0SL/J96uMVFUxOPScuEitGkSIGWlOugtXA1fBcXUrEyE9z8ZrAZLzIuOara
	jPsjBu4hc47AZojJCzMvTyraxPJ63CLzj/aBcAIdHHzE77eSh3QdsA+ZjSKYo6Zdi78wqfHs9EyHi
	zbPg3gLcDqIin/oFl0IX19WGPiSOZPGR/dyulmmgdH/Svl5PenqTWWAAgY8pTKqlgrVBvH1UkVWhh
	aHNBL2wIwKu+lBb7l5VBqt8E85g9nC5RlQnLQc+ul6XHRsx0PQEGZjTej+gp4jKOVbEeEPuARmAW9
	PUPjadIg==;
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPisT-00000006MuL-0GG9
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 13:53:46 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ab37d98dd4so14602935ab.3
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Dec 2024 05:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734962021; x=1735566821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnkagdjwjgNIPob+6WBvRRH+hXkhhZ41YnFLVb4sL9g=;
        b=V2Su2WTRtZoit0b4eLj5qEpVXwcFJ2CTTTw2Jh4ON39UWir+YMXr/Pjf/M+UQhvbS4
         A07c0+MSznCDkt3j/RnskT6h2YpsQoLoVnr+hWZ/IJkN0Qz57fFM4n0YNgtI38HxZ3KC
         ZLp+k48/SecWtg8B9SLuchMfldPPWJ3S53xTeGvLhZ7Zkixj8PuFADZkw65b6Zl4Davk
         QGw3PHvgtaur1k1BWj56sORmtC+8b7K6VAnvSrTa7O3RUqlwRYFq6RolMqNgVYVFFdLa
         NXmzBcGoxSDVeLaer/kIlPMYu0qPBYozDSxCxvoyv/yBe2298pwFgortoIuEAJV8iheu
         ae0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734962021; x=1735566821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnkagdjwjgNIPob+6WBvRRH+hXkhhZ41YnFLVb4sL9g=;
        b=E06cQfzPL0fD4CdyTyZQFlP8nkd0IgKwe2HACIFwNl1ceWSMtREJ5FMhgsRs22hoN6
         QcHHWPgDrNzq3D33ll1Jyb3qJ0OVz4cEecQNUxBe10tv3F911RLox/xRp5YFTBTSIUFs
         c00AkHBYQU1y0CffBjvYvTPLZpPcAVt62JAiGF0fvbBKkulxS/6dvDiWvb+3XmIMJCy2
         5WmeRD2ycq4LagiMHBL0A8CeXJBTcN9bpuyFDosg7F/pMNplEh473uM6vW43H3Z95GIt
         6kHRHZ4ktv4eV7iM/WxrNwwJD7Rrnp1nVVJzss7HM6prCZBTex3n/wFsu92q1PsfVT/F
         uITQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyZRhzOrhp1EGrhb4pkFWgt0byUhsfjBdF3bfRjUQmnnOTNEO9oWu7GEEKlP83Rt4WVrZB4Rw2pEs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVVk6SVn/LhYY8B1slDFUtSYTE9spwvwVCwZJ46uN30nSSQHip
	3xZJUgjXpGD2g2G3rtxCM/2GDFT+ZQec6HxFDo14Ooyw9kUM9IcXOEw2nhKLwm3c6DIRvoRKSQt
	PpqdmCJQSg79RyOok5SrAquyQGUbec54xc2wHCQ==
X-Gm-Gg: ASbGncsYRPT+v0zpOMEzNFifMxZZ/Q2jmVfusjfR7dKXiIhO9YJ1rBzr7QJof4oEGG6
	VpmWL/3AalT/CwneQHaIXMzDe+OdB+7mNdBt+YRs=
X-Google-Smtp-Source: AGHT+IEwvacBcq9kn3WJJuHdSOtxROX9WlmJfaZm50Reex04d1j/d8xnGQEJRsPYoiEuXLYBTkoaA6s0B8KwuzpOaHE=
X-Received: by 2002:a92:cda6:0:b0:3a7:a738:d9c8 with SMTP id
 e9e14a558f8ab-3c2d14d1839mr94678015ab.2.1734962021044; Mon, 23 Dec 2024
 05:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com> <20241212-kvm_guest_stat-v1-2-d1a6d0c862d5@rivosinc.com>
In-Reply-To: <20241212-kvm_guest_stat-v1-2-d1a6d0c862d5@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Dec 2024 19:23:29 +0530
X-Gm-Features: AbW1kvZ80UCq3C-ao5tldPIkaQ5px9K8zD2jwUzYIr5JIMryNiwwWqsoNWNGfbo
Message-ID: <CAAhSdy065Gk9jiMns+NMED4nOR20=ii0_rVrJZc+_EJ1DmkXVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: KVM: Update firmware counters for various events
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_135345_168118_BFC8BFFF 
X-CRM114-Status: GOOD (  17.77  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMjoyN+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFNCSSBQTVUgc3BlY2lmaWNhdGlvbiBkZWZpbmVzIGZldyBm
aXJtd2FyZSBjb3VudGVycyB3aGljaCBjYW4gYmUKPiB1c2VkIGJ5IHRoZSBndWVzdHMgdG8gY29s
bGVjdCB0aGUgc3RhdHN0aWNzIGFib3V0IHZhcmlvdXMgdHJhcHMKPiBvY2N1cnJlZCBpbiB0aGUg
aG9zdC4KPgo+IFVwZGF0ZSB0aGVzZSBjb3VudGVycyB3aGVuZXZlciBhIGNvcnJlc3BvbmRpbmcg
dHJhcCBpcyB0YWtlbgo+Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQu
YyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4
IGM5ZjhiMjA5NDU1NC4uYWNkY2Q2MTk3OTdlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiBAQCAtMTY1
LDYgKzE2NSwxNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3RyYXBfcmVkaXJlY3Qoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnNzdGF0dXMg
fD0gU1JfU1BQOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBpbnQgdmNwdV9yZWRpcmVjdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fY3B1X3RyYXAgKnRyYXApCj4gK3sKPiArICAg
ICAgIGludCByZXQgPSAtRUZBVUxUOwo+ICsKPiArICAgICAgIGlmICh2Y3B1LT5hcmNoLmd1ZXN0
X2NvbnRleHQuaHN0YXR1cyAmIEhTVEFUVVNfU1BWKSB7Cj4gKyAgICAgICAgICAgICAgIGt2bV9y
aXNjdl92Y3B1X3RyYXBfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gKyAgICAgICAgICAgICAgIHJl
dCA9IDE7Cj4gKyAgICAgICB9Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICAvKgo+
ICAgKiBSZXR1cm4gPiAwIHRvIHJldHVybiB0byBndWVzdCwgPCAwIG9uIGVycm9yLCAwIChhbmQg
c2V0IGV4aXRfcmVhc29uKSBvbgo+ICAgKiBwcm9wZXIgZXhpdCB0byB1c2Vyc3BhY2UuCj4gQEAg
LTE4MywxNSArMTk0LDI3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgIHJ1bi0+ZXhpdF9yZWFzb24g
PSBLVk1fRVhJVF9VTktOT1dOOwo+ICAgICAgICAgc3dpdGNoICh0cmFwLT5zY2F1c2UpIHsKPiAg
ICAgICAgIGNhc2UgRVhDX0lOU1RfSUxMRUdBTDoKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19JTExFR0FMX0lOU04pOwo+ICsgICAg
ICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ICsgICAgICAgICAg
ICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX0xPQURfTUlTQUxJR05FRDoKPiArICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19NSVNB
TElHTkVEX0xPQUQpOwo+ICsgICAgICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUs
IHRyYXApOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX1NUT1JF
X01JU0FMSUdORUQ6Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3BtdV9pbmNyX2Z3
KHZjcHUsIFNCSV9QTVVfRldfTUlTQUxJR05FRF9TVE9SRSk7Cj4gKyAgICAgICAgICAgICAgIHJl
dCA9IHZjcHVfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+
ICAgICAgICAgY2FzZSBFWENfTE9BRF9BQ0NFU1M6Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNj
dl92Y3B1X3BtdV9pbmNyX2Z3KHZjcHUsIFNCSV9QTVVfRldfQUNDRVNTX0xPQUQpOwo+ICsgICAg
ICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ICsgICAgICAgICAg
ICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX1NUT1JFX0FDQ0VTUzoKPiArICAgICAgICAg
ICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19BQ0NFU1Nf
U1RPUkUpOwo+ICsgICAgICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXAp
Owo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX0lOU1RfQUNDRVNT
Ogo+IC0gICAgICAgICAgICAgICBpZiAodmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LmhzdGF0dXMg
JiBIU1RBVFVTX1NQVikgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1
X3RyYXBfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gMTsKPiAtICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICByZXQgPSB2Y3B1X3Jl
ZGlyZWN0KHZjcHUsIHRyYXApOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNh
c2UgRVhDX1ZJUlRVQUxfSU5TVF9GQVVMVDoKPiAgICAgICAgICAgICAgICAgaWYgKHZjcHUtPmFy
Y2guZ3Vlc3RfY29udGV4dC5oc3RhdHVzICYgSFNUQVRVU19TUFYpCj4KPiAtLQo+IDIuMzQuMQo+
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
