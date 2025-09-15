Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF621CAC592
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkJtSHjLSBh+kGn6iDHAFKFcqSh1GptClOPnzJRValY=; b=qwR88yzQHkQPQ7
	iPqcHFSmuLcWL1reKMjmE1OCU9TNkvhvmr4p6fUAoz2V/71sjy3ECHF6TsXiB9+WtNTOXw7uzof/d
	oRfYeeiUr4vts87roqxCvCeN9ahOBMu4pz02Jslbc3WE5f5uF/V7BYU0+MTsWnqtIltP7ncOuFWwM
	wzPn38OOPgvGdI2+va/+/0JQ8nDWD4wI7KkKbo4jsZFeMEGQnEeMmvhCu6R5zdIlDo+ERMONLH1uf
	uAhFHBOrHGL2Zv6MlEM68CB5gLRQsjmUPHBCm1feMbsAu3Yty0SeIFaqd4xKkPTnFqDtHdjIjkncn
	G5leqzydRYqxCOpwwJYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyELO-00000005SRS-1FGS;
	Mon, 15 Sep 2025 18:54:30 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyELM-00000005SQU-0wYy
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 18:54:29 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-40a8f56e59eso13832105ab.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757962467; x=1758567267; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHjtmkFYaDUtD28akM0L8ajAhLyVsgYa1W7tKXHErm0=;
        b=fcvHOscA4mDJzicfuO45h1BBUG6HhW3jw0Z+HyGSkfl8ZQVOlrDSZ+ccvHITjH1qSf
         BYf5PHnVfesVFEPc3POVHtOGGzAJyqUnJCMhyddBc91iBmRvLElCyb12ec3oKYoJP+yT
         lZs+b2DbG8/20viZ/0rabBD5CAOtqhOn8ztXDwA3XAIDsEQESArMwuoiu2w2A/gO9t0K
         jiY94WndKarsPtj/B6fGMi79k5PddKiaG/gpCGb4Puq9yro8dYL2GC5Wocp3qgD7cQIV
         YtY7NgWHDWp/IvjzWc6kk8BholXVTLd3MSD4e+knFCx8EWtQiJ9X+GUjczJ8aPKoQbRH
         ILoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757962467; x=1758567267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHjtmkFYaDUtD28akM0L8ajAhLyVsgYa1W7tKXHErm0=;
        b=s3XtPqeoGLt6u/JlmlaQeFse7vHENiO746Gd8EGCMrFqxZZL5bWCEc2e7pz8xx7HD4
         0wcKZt6wSMHSP3dMj5iMs6p2RgFPvShb3SutLYS5Qvmhe9yzwYCXugbKTRuatlmuuqEA
         CbIwbhq2QvTLpNfElWuBrpVwz6OFL/zmet896ie0H7GZumCfgRlx+3TkqrrnJ+uEWAQ0
         X15KFa6CNpg7yfYRkeaOwC8JrpaGiVprn0ph6KH56bMnlxGsaZWhea9YawEZD1syH9N8
         fb5qtG0mckhknw6vhW63fWGmo5+iI2CIL/LtCcmPjGgMh5bTZub6fNVCKholoXDfup3J
         e4vg==
X-Forwarded-Encrypted: i=1; AJvYcCXzg+QteO0iDsnWC+52D3kVpg6aH4ybRW2C2Z8F3Op2FupDj7Nw2oQxRS38ol8Z+wnf3v3hh1suMoM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8H2gZO6qfp8rxHUZyCoZqAJcx+TrT5SccjNKSZeIwUkA8l6SO
	r4n+6Q/PxVbsJXt/E3/xt1o5I4AMvUfmGkhCxxk8AXorW2lFC82je0o2gm74tZ37aiQ=
X-Gm-Gg: ASbGncvhSX63YbWa/PGPa4gzRdHwPoOHqGofdw+nkUbwyEIo8XSqtc0UW7lH6u+thvb
	hjJzS+gYwMPUWEjxWvkkstQOl+N7pbntY8HG1Bey98QZ17woMhLVIpHakYKo2aikIyhgvOHU8Nz
	K00QOpirr9WYdWyFHlnO8aSrpdd+s+ceWod5bsKgRkAT0dygjnS75ebjTofSsrvvfqtxJZMBLI9
	CghH82RAk38i6CI6xpweh13zCTvFkPc2XUZm7hh8BuBjYHeAaihagJroNfISJQIT9l5siFASw/9
	9Dl1f8LBj8D3l/6QwN4zzl3OXVpPt6YWH0n7CH922vAkYB/vMGI7HMheJJVVCnyGwfzQSfPq7T1
	8rezw2HIhbZOu1/6RU1OZPFE9zt88EPpuBAygtLid35ElEA==
X-Google-Smtp-Source: AGHT+IEjr6zGZqacHdWkL3Z8t38AIWoiSVtR9aH1dtfZivjd618GfxmSmMqQ2RxU5i5TL42raRKcFA==
X-Received: by 2002:a05:6e02:1a07:b0:408:c77b:a7ea with SMTP id e9e14a558f8ab-420a417433emr128421475ab.22.1757962467026;
        Mon, 15 Sep 2025 11:54:27 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4240059d880sm24827505ab.20.2025.09.15.11.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 11:54:26 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:54:25 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Jinyu Tang <tjytimi@163.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Tianshun Sun <stsmail163@163.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] KVM: riscv: Power on secondary vCPUs from migration
Message-ID: <20250915-23f31d3577fe91c7d9944b1f@orel>
References: <20250915122334.1351865-1-tjytimi@163.com>
 <DCTFU1UCDSZZ.3J6L3T6TYTELM@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DCTFU1UCDSZZ.3J6L3T6TYTELM@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_115428_266069_30AB7A2B 
X-CRM114-Status: GOOD (  28.16  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgMDQ6MTk6MjFQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMDktMTVUMjA6MjM6MzQrMDg6MDAsIEppbnl1IFRhbmcgPHRqeXRpbWlA
MTYzLmNvbT46Cj4gPiBUaGUgY3VycmVudCBsb2dpYyBrZWVwcyBhbGwgc2Vjb25kYXJ5IFZDUFVz
IHBvd2VyZWQgb2ZmIG9uIHRoZWlyCj4gPiBmaXJzdCBydW4gaW4ga3ZtX2FyY2hfdmNwdV9wb3N0
Y3JlYXRlKCksIHJlbHlpbmcgb24gdGhlIGJvb3QgVkNQVSAKPiA+IHRvIHdha2UgdGhlbSB1cCBi
eSBzYmkgY2FsbC4gVGhpcyBpcyBjb3JyZWN0IGZvciBhIGZyZXNoIFZNIHN0YXJ0LAo+ID4gd2hl
cmUgVkNQVXMgYmVnaW4gZXhlY3V0aW9uIGF0IHRoZSBib290YWRkcmVzcyAoMHg4MDAwMDAwMCku
Cj4gPgo+ID4gSG93ZXZlciwgdGhpcyBiZWhhdmlvciBpcyBub3Qgc3VpdGFibGUgZm9yIFZDUFVz
IHRoYXQgYXJlIGJlaW5nCj4gPiByZXN0b3JlZCBmcm9tIGEgc3RhdGUgKGUuZy4sIGR1cmluZyBt
aWdyYXRpb24gcmVzdW1lIG9yIHNuYXBzaG90Cj4gPiBsb2FkKS4gVGhlc2UgVkNQVXMgaGF2ZSBh
IHNhdmVkIHByb2dyYW0gY291bnRlciAoc2VwYykuIEZvcmNpbmcKPiA+IHRoZW0gdG8gd2FpdCBm
b3IgYSB3YWtlLXVwIGZyb20gdGhlIGJvb3QgVkNQVSwgd2hpY2ggbWF5IG5vdAo+ID4gaGFwcGVu
IG9yIG1heSBoYXBwZW4gaW5jb3JyZWN0bHksIGxlYXZlcyB0aGVtIGluIGEgc3R1Y2sgc3RhdGUK
PiA+IHdoZW4gdXNpbmcgUWVtdSB0byBtaWdyYXRpb24gaWYgc21wIGlzIGxhcmdlciB0aGFuIG9u
ZS4KPiA+Cj4gPiBTbyBjaGVjayBhIGNvbGQgc3RhcnQgYW5kIGEgd2FybSByZXN1bXB0aW9uIGJ5
IHRoZSB2YWx1ZSBvZiB0aGUgCj4gPiBndWVzdCdzIHNlcGMgcmVnaXN0ZXIuIElmIHRoZSBWQ1BV
IGlzIHJ1bm5pbmcgZm9yIHRoZSBmaXJzdCB0aW1lIAo+ID4gKmFuZCogaXRzIHNlcGMgaXMgbm90
IHRoZSBoYXJkd2FyZSBib290IGFkZHJlc3MsIGl0IGluZGljYXRlcyBhIAo+ID4gcmVzdW1lZCB2
Q1BVIHRoYXQgbXVzdCBiZSBwb3dlcmVkIG9uIGltbWVkaWF0ZWx5IHRvIGNvbnRpbnVlIAo+ID4g
ZXhlY3V0aW9uIGZyb20gaXRzIHNhdmVkIGNvbnRleHQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
SmlueXUgVGFuZyA8dGp5dGltaUAxNjMuY29tPgo+ID4gVGVzdGVkLWJ5OiBUaWFuc2h1biBTdW4g
PHN0c21haWwxNjNAMTYzLmNvbT4KPiA+IC0tLQo+IAo+IEkgZG9uJ3QgbGlrZSB0aGlzIGFwcHJv
YWNoLiAgVXNlcnNwYWNlIGNvbnRyb2xzIHRoZSBzdGF0ZSBvZiB0aGUgVk0sIGFuZAo+IEtWTSBz
aG91bGRuJ3QgcmFuZG9tbHkgY2hhbmdlIHRoZSBzdGF0ZSB0aGF0IHVzZXJzcGFjZSB3YW50cy4K
PiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1LmMKPiA+IEBAIC04NjcsOCArODY3LDE2IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3Rs
X3J1bihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiAgCXN0cnVjdCBrdm1fY3B1X3RyYXAgdHJh
cDsKPiA+ICAJc3RydWN0IGt2bV9ydW4gKnJ1biA9IHZjcHUtPnJ1bjsKPiA+ICAKPiA+IC0JaWYg
KCF2Y3B1LT5hcmNoLnJhbl9hdGxlYXN0X29uY2UpCj4gPiArCWlmICghdmNwdS0+YXJjaC5yYW5f
YXRsZWFzdF9vbmNlKSB7Cj4gPiAgCQlrdm1fcmlzY3ZfdmNwdV9zZXR1cF9jb25maWcodmNwdSk7
Cj4gPiArCQkvKgo+ID4gKwkJICogRm9yIFZDUFVzIHRoYXQgYXJlIHJlc3VtaW5nIChlLmcuLCBm
cm9tIG1pZ3JhdGlvbikKPiA+ICsJCSAqIGFuZCBub3Qgc3RhcnRpbmcgZnJvbSB0aGUgYm9vdCBh
ZGRyZXNzLCBleHBsaWNpdGx5Cj4gPiArCQkgKiBwb3dlciB0aGVtIG9uLgo+ID4gKwkJICovCj4g
PiArCQlpZiAodmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnNlcGMgIT0gMHg4MDAwMDAwMCkKPiAK
PiBPZmZsaW5lZCBWQ1BVcyBhcmUgbm90IGd1YXJhbnRlZWQgdG8gaGF2ZSBzZXBjID09IDB4ODAw
MDAwMDAsIHNvIHRoaXMKPiBwYXRjaCB3b3VsZCBpbmNvcnJlY3RseSB3YWtlIHRoZW0gdXAuCj4g
KERlcGVuZGluZyBvbiB2Y3B1LT5hcmNoLnJhbl9hdGxlYXN0X29uY2UgaXMgZmxha3kgYXQgYmVz
dCBhcyB3ZWxsLikKPiAKPiBQbGVhc2UgdHJ5IHRvIGZpeCB1c2Vyc3BhY2UgaW5zdGVhZCwKClll
cywgYW5kIG1heWJlIGl0J3MgYWxyZWFkeSBmaXhlZApodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTA5MTUwNzA4MTEuMzQyMjU3OC0xLXhiQHVsdHJhcmlzYy5jb20vCgpUaGFua3MsCmRy
ZXcKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
