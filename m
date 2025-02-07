Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B6C02194
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIWxZHADL7y+e2B8YGazX4m1WT7k1peNr2V36Unqp4U=; b=fggE7lPBclWbUP
	/nN/tUdvQpOQls9Ldu+m3osiVdLeWayaO2XeSodtdP1FzjN5z3rLOAk+s/I3bssu7bzhSpCqbeJDw
	MYexhVRGvNE9jNoXjtDSpPNy81zWRRgQa+I9zCgStMXuoVJA2QXuyuBvjLCIa+5n0UIkzYX8xwsCZ
	dbCcCB+XLKj5skrUyYCqb8IcaESuIhR0Zwcbv3dDv70XLpZkWn7lPGcjdS2hoyQtknmtpSnHOQJ4A
	GbHbYJ5Y15M+Om/IHKS9SuFW14UhLuyUMJwGycIVj4c1gMtNtK/F9+z6c02/rLs723I5joBITnwzt
	GmOVmYZqcM83Zei34kVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRtm-0000000ARaB-0RU8;
	Fri, 07 Feb 2025 17:12:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRcI-0000000AN5R-1LLu
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:54:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2166651f752so52457045ad.3
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738947249; x=1739552049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UvshL8nXVJdd7vp4+YSGo25p1rD7pCcETOL1e0fbZQ=;
        b=1FF10y2QbHjyjxXYr/oUQvbcJB00UKeMLeEt5hfWNytD+ojYL1gulndrOTk7XKzebx
         7Gu01+5XEkGY50ioyUyhF+NLV8iXJXiIR1qnU/Ad/emRU1EsfwJHL8qDOBYNyvfFg2IP
         Zbp4YCyEiaSbUkPzDJvRwBO7r6Pkb0+RXOGg5eWWO9KdaB5jC4sqqnIwqngTbqEOAxMp
         lvDsrGZYh0L0MqJux1cNkQ08jcMcXmvtXv4iPdFKszL/1cc6mwR2nMbAEr3QjIDZUBHb
         26FMb/RjPF+RONF0jW/ewo0k0mrAv477jbhxPVdAIPdmmYynrQ1vFSDXxjT40p/rAA7x
         84Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947249; x=1739552049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UvshL8nXVJdd7vp4+YSGo25p1rD7pCcETOL1e0fbZQ=;
        b=b+G9aeU+mFesIu/hZxfORrRGgthK8HGj6OEibWl3SP0pXABrYC4YZypqA3UTbRH+cg
         GrJPCPJzu1Wih63W5VvQGpDc9+ojWAmIKhKalhCTbQomfOUgrX6xXHcjjhZ886Y4V3w9
         URljF613abgF27W90fDBbATlDhQi/0jriJdFq+3KjAiyXdand9Dq2khEDGf92o+CSBbR
         DVGb8Y6GnLW3/h+ewAN70dnrXhFVkVbzEhGiOrUUUvS3UpWpGQD75+Po0K5bVmDr+5Ij
         ccGFJbjNmJgyTKseTpH629T44/0EQzr0V0eK473W7BOaJ+8ExrLePHeqcnHE0mEcNPzj
         uasg==
X-Forwarded-Encrypted: i=1; AJvYcCVkSi7UA6eWounmNa/79wLeBPRcXJSxyUge/hmXobVjI3yzDGmlcHCHXgp23FSxSVZxgBynpV/rIhs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEFFoOM8pjg66e/DTtxRQ106WZvSGjcziFmRLLfNBtD02ahy6i
	Ja7zn3NcBot1cy9GhjM2ZELSqp6GXPpk6bRLd9LUwd6RuLMMdFTSNq9TpXymzrZ1B9V6Nqt6lwm
	2rWzPxdm1Ix5Y6RvNOXZXRi2PaD9ctLVex3fTTg==
X-Gm-Gg: ASbGncvcUfFwbJEuFUVWLKpsKmNlNvnDxCkD27XUewuHo/tCfdCkRzHG+yJxsbaPK6y
	wQd/25TwQRLTiNNCQxPPOszhUkuT5oJjEwjc4dFb1rGYajiSr63ymu/qY4VDltW3JiSH/NKDSLQ
	==
X-Google-Smtp-Source: AGHT+IGcOreyYzVTdgMb0QBe7xfS8Hq4n/vBf0b22MVHxkWExD11jxox3l4GddXf+HqClKoe976BaxK99Tn7Vq/+DBg=
X-Received: by 2002:a05:6a21:3399:b0:1e0:d4f4:5b39 with SMTP id
 adf61e73a8af0-1ee03a9b0afmr7073525637.24.1738947249048; Fri, 07 Feb 2025
 08:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-11-835cfa88e3b1@rivosinc.com> <20250206105100.GA2971@willie-the-truck>
In-Reply-To: <20250206105100.GA2971@willie-the-truck>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 7 Feb 2025 08:53:59 -0800
X-Gm-Features: AWEUYZl2-SoqDPQ6r-GdOfUPJBX1qdNjRlIcNpQpRwZeLOQULWh9MTRajFVfra0
Message-ID: <CAHBxVyEtxoRHLO791r6uFzHnX0vAcpeWMOcS+0tbVN+p6Oh2tQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/21] RISC-V: perf: Restructure the SBI PMU code
To: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_085410_376907_1E1382F6 
X-CRM114-Status: GOOD (  20.24  )
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

T24gVGh1LCBGZWIgNiwgMjAyNSBhdCAyOjUx4oCvQU0gV2lsbCBEZWFjb24gPHdpbGxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAwNSwgMjAyNSBhdCAxMToyMzoxNlBNIC0wODAw
LCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IFdpdGggU3NjY2ZnL1NtY2RlbGVnLCB3ZSBubyBsb25n
ZXIgbmVlZCBTQkkgUE1VIGV4dGVuc2lvbiB0byBwcm9ncmFtLwo+ID4gYWNjZXNzIGhwbWNvdW50
ZXIvZXZlbnRzLiBIb3dldmVyLCB3ZSBkbyBuZWVkIGl0IGZvciBmaXJtd2FyZSBjb3VudGVycy4K
PiA+IFJlbmFtZSB0aGUgZHJpdmVyIGFuZCBpdHMgcmVsYXRlZCBjb2RlIHRvIHJlcHJlc2VudCBn
ZW5lcmljIG5hbWUKPiA+IHRoYXQgd2lsbCBoYW5kbGUgYm90aCBzYmkgYW5kIElTQSBtZWNoYW5p
c20gZm9yIGhwbWNvdW50ZXIgcmVsYXRlZAo+ID4gb3BlcmF0aW9ucy4gVGFrZSB0aGlzIG9wcG9y
dHVuaXR5IHRvIHVwZGF0ZSB0aGUgS2NvbmZpZyBuYW1lcyB0bwo+ID4gbWF0Y2ggdGhlIG5ldyBk
cml2ZXIgbmFtZSBjbG9zZWx5Lgo+ID4KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
Pgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgNCArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfcG11
LmggICAgICAgICAgICAgfCAgIDQgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3NiaS5oICAgICAgICAgICAgIHwgICAyICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ID4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICBkcml2ZXJz
L3BlcmYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICstCj4gPiAg
ZHJpdmVycy9wZXJmL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCAr
LQo+ID4gIGRyaXZlcnMvcGVyZi97cmlzY3ZfcG11LmMgPT4gcmlzY3ZfcG11X2NvbW1vbi5jfSAg
fCAgIDAKPiA+ICBkcml2ZXJzL3BlcmYve3Jpc2N2X3BtdV9zYmkuYyA9PiByaXNjdl9wbXVfZGV2
LmN9IHwgMjE0ICsrKysrKysrKysrKystLS0tLS0tLS0KPgo+IFRoaXMgc2VlbXMuLi4gZ3JhdHVp
dG91cz8gSXQgZmVlbHMgbGlrZSByZW5hbWluZyB0aGUgZmlsZSBjb3VsZCBiZSBhIHBhaW4KPiBm
b3IgbWFuYWdpbmcgYmFja3BvcnRzIGFuZCByZW5hbWluZyB0aGUgZHJpdmVyIG1pZ2h0IGNhdXNl
IHNvbWUgaGVhZGFjaGVzCj4gaW4gdXNlcnNwYWNlLgo+Cj4gV2hhdCBkbyB5b3UgZ2FpbiBmcm9t
IHN1Y2ggYW4gaW52YXNpdmUgY2hhbmdlPwo+CgpUaGUgY3VycmVudCB1cHN0cmVhbSBkcml2ZXIg
d2FzIGRldmVsb3BlZCBvbmx5IGZvciBTQkkgUE1VWzFdIGR1ZSB0bwpsYWNrIG9mIGFueSBJU0Eg
ZXh0ZW5zaW9uIHN1cHBvcnQgdGhhdCBhbGxvd3MgUE1VIHByb2dyYW1taW5nIGZyb20gdGhlCmtl
cm5lbC4KVGh1cywgdGhlIG5hbWUgb2YgdGhlIGZpbGUgYW5kIHRoZSBmdW5jdGlvbnMgcmVmbGVj
dCB0aG9zZSBhc3N1bXB0aW9ucy4KCklNTywgaXQgd291bGQgYmUgY29uZnVzaW5nIHRvIHVzZSBh
IGRyaXZlciBuYW1lZCBzYmkgdGhhdCBhbHNvIHVzZXMKdGhlIG5ldyBJU0EgZXh0ZW5zaW9ucyB0
aGF0IGFsbG93cyBkaXJlY3QgUE1VIHByb2dyYW1taW5nIGZyb20gdGhlCmtlcm5lbC4KVGhpcyBw
YXRjaCBhbGxvd3MgdGhlIGludGVybmFsIGZ1bmN0aW9ucyBhbmQgc3RydWN0dXJlIHRvIGNsZWFy
bHkKaWRlbnRpZnkgdHdvIHdheXMgb2YgUE1VIHByb2dyYW1taW5nLgpUaGVyZSBhcmUgbW9yZSBQ
TVUgcmVsYXRlZCBJU0EgZXh0ZW5zaW9ucyBwbGFubmVkIGluIHRoZSBmdXR1cmUgYXMKd2VsbC4g
VGh1cywgSSBmZWx0IGl0IHdvdWxkIGJlIGJlc3QgdG8gZG8gdGhlc2UgY2hhbmdlcyBub3cgcmF0
aGVyCnRoYW4gbGF0ZXIuCkkgdW5kZXJzdGFuZCB0aGF0IG1hbmFnaW5nIHRoZSBiYWNrcG9ydCB3
b3VsZCBiZSBhIHBhaW4gYXMgYSByZXN1bHQKYnV0IEkgZGlkbid0IHF1aXRlIHVuZGVyc3RhbmQg
dGhlIGNvbmNlcm4gYWJvdXQgdGhlIHVzZXJzcGFjZQpoZWFkYW5jZXMuCkNhbiB5b3UgcGxlYXNl
IGNsYXJpZnkgdGhhdCA/CgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2Evcmlz
Y3Ytc2JpLWRvYy9ibG9iL21hc3Rlci9zcmMvZXh0LXBtdS5hZG9jCgoKPiBXaWxsCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
