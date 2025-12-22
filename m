Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE41D711D5
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 05:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5PUJ9jdzxT05HCiKPmvsoMGxYWraYCaIiGeF3RtX0c=; b=ykXY+IZu/E+/JN
	1fE/vBacR1D9wGklN71UhxRyyCRlVMV/zs+lIIURjI8DV1bz+hZ+q1pVHDnYbV8utnb+ZmTzkum5l
	T+0yu0DvkGXzaWdPQXYRf6fFxdQ77sAdEEd3OzuGUzE5Ph6/N0tqQiB4SCIn9KUQvtGQTkAVChAv1
	eu36VLzeYA6nte6nYbHxKlYAIt1d1v41MgCjhdEBskuGAJN3oflnyOnykGpildoyO6m07y37EduDT
	uYcpWbQg9C64/ylHMdLThTGvj1A9mhl2TSGI9Um3/L6ugClWIa7rt3SdMMeVLpGnUfG7j+tb4GA4U
	Zk7rCQDHLDOX+nLwirnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXY5J-0000000D5p6-0PN5;
	Mon, 22 Dec 2025 05:03:53 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXY5F-0000000D5oF-1M3S
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 05:03:50 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-3f0cbfae787so3266250fac.3
        for <kvm-riscv@lists.infradead.org>; Sun, 21 Dec 2025 21:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766379827; x=1766984627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy9ZgPgnx+KQ7BMNaVsbyPKbe9xDbdHd4prPK2wn3fY=;
        b=kGS6O04julx38MOVxpcsZADrzHfzSdFAze1uwLxh8UzBllTobPlAAUzhH1oRSLboWg
         vPVYeYmBZIb3TI4S3vFYrqNMQXq1egodAYipOiNY7uJiWqyrGlY68NDepaXvbqzTVWCJ
         ugdsBXfzyHeqHnR3LNTLMboVqyb2FfE8N8ZWkXDba9CuHiirmkImT/pgBsvlWknduqMY
         RU0FF8a/TIDcNpn8VXUCpR+YF+fsmkmY9/Rmc2IKpYcD/QxcKDUG8wMkMy0W+zWUEIYK
         VA3tidPa+Gkp8c3v6P5Qoo+wb/iOll6KHl/YaETenrRAIh+oaIFYCdtLzhHi6Ua83LHG
         itng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766379827; x=1766984627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy9ZgPgnx+KQ7BMNaVsbyPKbe9xDbdHd4prPK2wn3fY=;
        b=uuJknyHu2Sl6dpdAkoI25GJB2NUUJ24ZsC6jyNGBxKa7sh3QsTeHhmTzWCssgzgCBF
         62UFd6Ep4Z4M/pqDRBRejvGRHCOYRj7VSPpigEx4A6UVGRuOilFa/Tnu/ZkQTInVRyuZ
         GY2XQhYOI+h3DlgMuKdlu4hsyePW/O9TIOVoQMjUbK0ZVWTtgu4RTUdFOGTDehe4H8+O
         jDKjw+YLTaGgHdCxwGwZ8X4Yuph/0SXucPqT7k3UIOlT3lmiIK5UfJATrzmP2L+Y8uj+
         lqLcgDarcThY6QSu2lg0dn9IzA3iulOihStCjLqpC/1VJQs9RkXwOXep6glDhVCRoGEH
         JA6w==
X-Forwarded-Encrypted: i=1; AJvYcCVFj0TM6O+hXqEgJRtxO8TXfCVofXhT0kRC7fklmgzHQ//dMWEgxDDvh1GQHGlsLqzRess8SozT6cQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4pyl4LmPkeaS2Ab8ea+7gvmlSQyrn0pquWtNEKPXy9zFOBhY1
	aaYNMTwshNUJ6KrOlROklzvZZzBlV+zSItLyBmbMl7o6+yIUA2Fw9V0jJzHQ4oxjqFB6dNk+M02
	4jZ+iewbzKGO5ErlPlXqjcSCsk5W0rx01XhG41itHCA==
X-Gm-Gg: AY/fxX6CrBRHni+y09cGXsNJzXsdyKs4pBobmgapiZxw6xyddx3ndDseKcZLqhhqQIC
	U67PM/1uaCF2P0Vw/p3EyOIO/z83AX9KWYZnHQXD6gb7n9EgbxXBI06/sBMVKeMulfIu97BxWXj
	y2t9F4KuVpG7ltNhNFVzrbtQin5d5Ttjl9usFL+V2Gtkw1r9yVhwi7QOnL/0Zpzck6rdiObD+/5
	USMTdDz8X1hVQgWOF2IgbEaYh1e7/T6JrPlrwHw0Yjokc1baKvWNrNDbDz0gvZW/TUSZ69R9OxT
	nEdhWDg=
X-Google-Smtp-Source: AGHT+IHKvupHro/hyAQmz/UbSx9bp78T+3p3ZGuqrZrOOXP0J2lbd0Nbq+Z7QXEgflbpCa+jplwI2INuovHvot6H1ks=
X-Received: by 2002:a4a:ddcb:0:b0:659:9a49:8f55 with SMTP id
 006d021491bc7-65d0e99fd3cmr3454670eaf.26.1766379827059; Sun, 21 Dec 2025
 21:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20251220163713.34040-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251220163713.34040-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Dec 2025 10:33:34 +0530
X-Gm-Features: AQt7F2rHINEGxooKlYvEjJ0KOTniXCDPUi7Tp7Ga57aVoykJu_SMOEsVgSJ7joI
Message-ID: <CAAhSdy1rHO407BwLtP-s5J1fJtcp2GfvvhtEEpnN2AOn79s8qg@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/riscv-imsic: Adjust the number of available
 guest irq files
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_210349_623171_7AC38F4A 
X-CRM114-Status: GOOD (  23.23  )
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

T24gU2F0LCBEZWMgMjAsIDIwMjUgYXQgMTA6MDfigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBEdXJpbmcgaW5pdGlhbGl6YXRpb24sIGtlcm5lbCBtYXBz
IHRoZSBNTUlPIHJlc291cmNlcyBvZiBJTVNJQywgd2hpY2ggaXMKPiBwYXJzZWQgZnJvbSBBQ1BJ
IG9yIERUUyBhbmQgbWF5IG5vdCBzdHJpY3RseSBjb250YWlucyBhbGwgZ3Vlc3QKPiBpbnRlcnJ1
cHQgZmlsZXMuIFBhZ2UgZmF1bHQgaGFwcGVucyB3aGVuIEtWTSB3cm9uZ2x5IGFsbG9jYXRlcyBh
bgo+IHVubWFwcGVkIGd1ZXN0IGludGVycnVwdCBmaWxlIGFuZCB3cml0ZXMgaXQuCgpUaGUgbW90
aXZhdGlvbiBpcyBub3QgY2xlYXIgZnJvbSB0aGUgYWJvdmUgdGV4dCBhbmQgbmVlZHMgdG8gaW1w
cm92ZS4KCkhvdyBhYm91dCB0aGUgZm9sbG93aW5nID8KCkN1cnJlbnRseSwgS1ZNIGFzc3VtZXMg
dGhlIG1pbmltdW0gb2YgaW1wbGVtZW50ZWQgSEdFSUUgYml0cyBhbmQKIkJJVChnYy0+Z3Vlc3Rf
aW5kZXhfYml0cykgLSAxIiBhcyB0aGUgbnVtYmVyIG9mIGd1ZXN0IGZpbGVzIGF2YWlsYWJsZQph
Y3Jvc3MgYWxsIENQVXMuIFRoaXMgd2lsbCBub3Qgd29yayBvbmx5IHdoZW4gQ1BVcyBoYXZlIGRp
ZmZlcmVudCBudW1iZXIKb2YgZ3Vlc3QgZmlsZXMgYmVjYXVzZSBLVk0gbWF5IGluY29ycmVjdGx5
IGFsbG9jYXRlIGEgZ3Vlc3QgZmlsZSBvbiBhIENQVQp3aXRoIGZld2VyIGd1ZXN0IGZpbGVzLgoK
Pgo+IFRodXMsIGR1cmluZyBpbml0aWFsaXphdGlvbiwgd2UgY2FsY3VsYXRlIHRoZSBudW1iZXIg
b2YgYXZhaWxhYmxlIGd1ZXN0CgpzL1RodXMsIGR1cmluZyBpbml0aWFsaXphdGlvbi9UbyBhZGRy
ZXNzIHRoZSBhYm92ZS8KCj4gaW50ZXJydXB0IGZpbGVzIGFjY29yZGluZyB0byBNTUlPIHJlc291
cmNlcyBhbmQgY29uc3RyYWluIHRoZSBudW1iZXIgb2YKPiBndWVzdCBpbnRlcnJ1cHQgZmlsZXMg
dGhhdCBjYW4gYmUgYWxsb2NhdGVkIGJ5IEtWTS4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxs
dXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyAg
ICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtc3RhdGUuYyB8IDcgKysrKysrLQo+ICBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1z
aWMuaCAgICAgfCAzICsrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMgYi9hcmNo
L3Jpc2N2L2t2bS9haWEuYwo+IGluZGV4IGRhZDMxODE4NTY2MDAuLmNhYzNjMmI1MWQ3MjQgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9h
aWEuYwo+IEBAIC02MzAsNyArNjMwLDcgQEAgaW50IGt2bV9yaXNjdl9haWFfaW5pdCh2b2lkKQo+
ICAgICAgICAgICovCj4gICAgICAgICBpZiAoZ2MpCj4gICAgICAgICAgICAgICAgIGt2bV9yaXNj
dl9haWFfbnJfaGdlaSA9IG1pbigodWxvbmcpa3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKGdjLT5ndWVzdF9pbmRl
eF9iaXRzKSAtIDEpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ2MtPm5yX2d1ZXN0X2ZpbGVzKTsKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAg
a3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpID0gMDsKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXN0YXRlLmMKPiBpbmRleCBkYzk1YWQ4NTZkODBhLi4xZTk4MmNlMDI0YTQ3IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+ICsrKyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IEBAIC03OTQsNyArNzk0LDcg
QEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0cnVjdCBmd25vZGVfaGFu
ZGxlICpmd25vZGUsCj4KPiAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gIHsKPiAtICAgICAgIHUzMiBpLCBq
LCBpbmRleCwgbnJfcGFyZW50X2lycXMsIG5yX21taW9zLCBucl9oYW5kbGVycyA9IDA7Cj4gKyAg
ICAgICB1MzIgaSwgaiwgaW5kZXgsIG5yX3BhcmVudF9pcnFzLCBucl9tbWlvcywgbnJfZ3Vlc3Rf
ZmlsZXMsIG5yX2hhbmRsZXJzID0gMDsKPiAgICAgICAgIHN0cnVjdCBpbXNpY19nbG9iYWxfY29u
ZmlnICpnbG9iYWw7Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWNfbG9jYWxfY29uZmlnICpsb2NhbDsK
PiAgICAgICAgIHZvaWQgX19pb21lbSAqKm1taW9zX3ZhID0gTlVMTDsKPiBAQCAtODg4LDYgKzg4
OCw3IEBAIGludCBfX2luaXQgaW1zaWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUg
KmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+ICAgICAgICAgfQo+Cj4gICAgICAgICAvKiBDb25maWd1
cmUgaGFuZGxlcnMgZm9yIHRhcmdldCBDUFVzICovCj4gKyAgICAgICBnbG9iYWwtPm5yX2d1ZXN0
X2ZpbGVzID0gQklUKGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cykgLSAxOwo+ICAgICAgICAgZm9y
IChpID0gMDsgaSA8IG5yX3BhcmVudF9pcnFzOyBpKyspIHsKPiAgICAgICAgICAgICAgICAgcmMg
PSBpbXNpY19nZXRfcGFyZW50X2hhcnRpZChmd25vZGUsIGksICZoYXJ0aWQpOwo+ICAgICAgICAg
ICAgICAgICBpZiAocmMpIHsKPiBAQCAtOTI4LDYgKzkyOSwxMCBAQCBpbnQgX19pbml0IGltc2lj
X3NldHVwX3N0YXRlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHZvaWQgKm9wYXF1ZSkK
PiAgICAgICAgICAgICAgICAgbG9jYWwtPm1zaV9wYSA9IG1taW9zW2luZGV4XS5zdGFydCArIHJl
bG9mZjsKPiAgICAgICAgICAgICAgICAgbG9jYWwtPm1zaV92YSA9IG1taW9zX3ZhW2luZGV4XSAr
IHJlbG9mZjsKPgoKTmVlZCBjb21tZW50cyBleHBsYWluaW5nIHdoeSB3ZSBhcmUgdGFraW5nIHRo
ZQptaW5pbXVtIG51bWJlciBvZiBndWVzdCBmaWxlcyBhY3Jvc3MgQ1BVcy4KCj4gKyAgICAgICAg
ICAgICAgIG5yX2d1ZXN0X2ZpbGVzID0gKHJlc291cmNlX3NpemUoJm1taW9zW2luZGV4XSkgLSBy
ZWxvZmYpIC8gSU1TSUNfTU1JT19QQUdFX1NaIC0gMTsKPiArICAgICAgICAgICAgICAgZ2xvYmFs
LT5ucl9ndWVzdF9maWxlcyA9IGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMgPiBucl9ndWVzdF9maWxl
cyA/IG5yX2d1ZXN0X2ZpbGVzIDoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXM7CgpnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzID0g
bWluKG5yX2d1ZXN0X2ZpbGVzLCBnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzKTsKCj4gKwo+ICAgICAg
ICAgICAgICAgICBucl9oYW5kbGVycysrOwo+ICAgICAgICAgfQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oIGIvaW5jbHVkZS9saW51eC9pcnFjaGlw
L3Jpc2N2LWltc2ljLmgKPiBpbmRleCA3NDk0OTUyYzU1MTg3Li40M2FlZDUyMzg1MDA4IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiBAQCAtNjksNiArNjksOSBAQCBzdHJ1
Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyB7Cj4gICAgICAgICAvKiBOdW1iZXIgb2YgZ3Vlc3QgaW50
ZXJydXB0IGlkZW50aXRpZXMgKi8KPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBucl9ndWVzdF9pZHM7Cj4KPiArICAgICAgIC8qIE51bWJlciBvZiBndWVz
dCBpbnRlcnJ1cHQgZmlsZXMgcGVyIGNvcmUgKi8KPiArICAgICAgIHUzMiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBucl9ndWVzdF9maWxlczsKPiArCj4gICAgICAgICAvKiBQ
ZXItQ1BVIElNU0lDIGFkZHJlc3NlcyAqLwo+ICAgICAgICAgc3RydWN0IGltc2ljX2xvY2FsX2Nv
bmZpZyBfX3BlcmNwdSAgICAgICpsb2NhbDsKPiAgfTsKPiAtLQo+IDIuMjAuMQo+CgpSZWdhcmRz
LApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
