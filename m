Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A56CAC595
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uh6Y8KCk2/vfClGS3kU89Bap4SDtavnPFwWAVkzAL/w=; b=e2eoAbAMcfEW9T
	chyHagfzjzLnsu0vV2JIeZemTvIW5ASpJBA1DhU+z3OOwSMTyi1glm92U5MmHkHd7XBYnlZlvSvT0
	bbe86ChXsPLwnvrS+aoXOu8rEGr96LjWYURaojl1iqZXIkEKaE3F+WCugHDayIem/XFulpBQ89kic
	AFHpOPp5I1cgDiyXHPwYd+d5EFklLtD4P8WlyaZAIuCE8HZNWbBTe5m4JdPTxL+ZaIrGYdF9diBA/
	60spz9yoQ5WjegZTU+fkJvf3U3nBfeNMf+JVphv/2QjxcUSJdipBClbIH3UAEmSHyRQiOPKKIuEAy
	jTs1ifB4OlArMhDnGv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0nV-00000008NbI-2VK5;
	Tue, 09 Sep 2025 16:02:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy5A-00000007HD5-07fg
	for kvm-riscv@bombadil.infradead.org;
	Tue, 09 Sep 2025 13:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H02U+YPaV9x25+zlEas3Ch0Yf6NwtoizNMk25VmvRb8=; b=laVSE7i5nzyvJ30d7e2E+8Gdu5
	13i1DG7aCixsKSdwoSrrC39eKhOngRjZSM1bOtgCMV0/6LrSg9JsitInUfNnTjjU9bImu3loOH2pK
	kCDo+HcR2bGHBv4WZghdXAON3KSqJ0blwho8ruK+IYDDhVwI+LXsVfhQrSBkzUt4ZBnw4Shm58608
	cj/GRaf9TIRFGaUVewTf/OXKBP1Fdzxu98Y4OOiGRKAoeqe9HWWwVXhgNEJyg1DH48beUFlrtgScV
	pdTymNYFBdUbRecFwKrm9fssiFqMP242vwGmC3bEaR8nFnKmMjMiMeOvV+xFGHclbWG/TuuL5E8tb
	WpA//xjg==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy56-00000005NU9-3Dwu
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 13:08:22 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-406630d3b17so22405955ab.0
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757423298; x=1758028098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H02U+YPaV9x25+zlEas3Ch0Yf6NwtoizNMk25VmvRb8=;
        b=k/k2yjGDRPslvJVvhUJINldVJmLHKEV0mV+ttbhYnIeEmkCMC1Uyxyz45981AXjBJ9
         aOvGmtq9VuzhpPk5NcpaOg08CIRHtolNMzhHWcbyFN1nX8y8A1xG14QWj7FRbwBTKuPL
         WMP4x618/paqH3nMrU8yLebE+Mia8mLyyhI6GFF3O0fAnbYs+n3jTFfB0CoMrTQyvqxC
         OZKqCD+Cc/Czx+7yNsyiK9LXl6pnEpQOTMU49pWh8lP6PddclqvAGQPfDc3SD88qIZ+g
         NZtQNk1/4E4W04vt5V990MkMpvPDcjuuOpIp5NFgOLAx/7vW6cUM0FaD5yiWc89G+tqR
         EVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757423298; x=1758028098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H02U+YPaV9x25+zlEas3Ch0Yf6NwtoizNMk25VmvRb8=;
        b=xA6EleCxXTsTT3Yc4dlLAMd0BcEgSZoG07+jt1l3fG20W5/0inWDUbB43yoUnDrGrn
         BbUWvxoVyRfHBcD7o4UCX3BFa6NF3o/e68CQvaxtHLOHx97hcB0KeeJdsO73CiuuCitY
         t4z1WJwu5k0CE4fZzEpeI/e/bWu5z7jD3TdotzAgoaLV+EHwxz4YTqZ9cJuRqFD94iD6
         HCcwL5xo7IfxeJuu3rAo43JIZ8WFbPlWlRF8uG2agki0RdOWM1/KbETAKGneL9rho5CU
         0DmpmfFvv2NGHI+SmIZDv80fCqouxZAio36bOxwXB98qzGWEZT5JYHva3qzfZKI+OTNG
         0KbA==
X-Forwarded-Encrypted: i=1; AJvYcCUFVm4glqoS5IDh5UJF6VQVIVm1QhCQy2ZFKyYmzCmgnLonIPRtZuptfTLOkje8CLe5GzGLQ8n+G3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMA3lkS6kZYjcBWhhuWckH9IVtEE/P4IwPuUiBgtqfXWYFXFey
	bFUwh9yk8iE+PAkyUhv9hwBsAns8vZI0yoWz9LXnPEyiPTmEymuElBHFCgZvRJmSiMSNshEI4Ai
	OKXskVdO19awsqnXsMyRNJ2OEMaAyx2Ps+hxqxd3Vhw==
X-Gm-Gg: ASbGnct2vkAKSAxGzPObygW+11ci6gY1ypbl+X7fBYs6v1SfldCuzXexBeFMjCIrGFO
	C8cbdo3/VBY9LvyLTWXTINAkfGQJzUC542mdtGtVV4g8xUh7Tx+jwKsHRWlGGxaCdAXVwSlh+i0
	w//vGEBgNGnKA16zHYcsGjMXze10slxjHuneuHqwESzo1ND7F+EJBQUbPT4EpuJNF8j1LF2oS8m
	UGCuaHc7zukxyg6YEsJ9H88fUMcZH0AxzNPMg++/HMrnGKE73T4uqULSSLQ5A==
X-Google-Smtp-Source: AGHT+IGIXFEd6NKG4t1EShH+ohsgxoCLtKtko69/nI1/uYg3PQTsrCp5aYkq76x9El7gzpg8jEvl7mss/PUosQ8Pi6Q=
X-Received: by 2002:a05:6e02:1987:b0:415:de5:2e1 with SMTP id
 e9e14a558f8ab-4150de504admr1018785ab.18.1757423297934; Tue, 09 Sep 2025
 06:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com> <20250909-pmu_event_info-v6-4-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-4-d8f80cacb884@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Sep 2025 18:38:06 +0530
X-Gm-Features: Ac12FXxyfsjvXfBOgxxqCKAcoZ2p-9S1up8nmISURF_bFVVeW9nkGyF0NIeOPT0
Message-ID: <CAAhSdy30m5uwt1HBPoKdh6VMUjZxR6tPznUGBmb5D6YWMYPw3w@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] drivers/perf: riscv: Implement PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_140821_034300_4B445708 
X-CRM114-Status: GOOD (  23.61  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCAxMjozM+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFdpdGggdGhlIG5ldyBTQkkgUE1VIGV2ZW50IGluZm8gZnVu
Y3Rpb24sIHdlIGNhbiBxdWVyeSB0aGUgYXZhaWxhYmlsaXR5Cj4gb2YgdGhlIGFsbCBzdGFuZGFy
ZCBTQkkgUE1VIGV2ZW50cyBhdCBib290IHRpbWUgd2l0aCBhIHNpbmdsZSBlY2FsbC4KPiBUaGlz
IGltcHJvdmVzIHRoZSBib290aW1lIGJ5IGF2b2lkaW5nIG1ha2luZyBhbiBTQkkgY2FsbCBmb3Ig
ZWFjaAo+IHN0YW5kYXJkIFBNVSBldmVudC4gU2luY2UgdGhpcyBmdW5jdGlvbiBpcyBkZWZpbmVk
IG9ubHkgaW4gU0JJIHYzLjAsCj4gaW52b2tlIHRoaXMgb25seSBpZiB0aGUgdW5kZXJseWluZyBT
QkkgaW1wbGVtZW50YXRpb24gaXMgdjMuMCBvciBoaWdoZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAgOSArKysrKysKPiAgZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCj4gaW5kZXggYjBjNDFlZjU2OTY4Li41Y2E3Y2ViYzEzY2MgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKPiBAQCAtMTM2LDYgKzEzNiw3IEBAIGVudW0gc2JpX2V4dF9wbXVfZmlkIHsKPiAg
ICAgICAgIFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCwKPiAgICAgICAgIFNCSV9FWFRfUE1V
X0NPVU5URVJfRldfUkVBRF9ISSwKPiAgICAgICAgIFNCSV9FWFRfUE1VX1NOQVBTSE9UX1NFVF9T
SE1FTSwKPiArICAgICAgIFNCSV9FWFRfUE1VX0VWRU5UX0dFVF9JTkZPLAo+ICB9Owo+Cj4gIHVu
aW9uIHNiaV9wbXVfY3RyX2luZm8gewo+IEBAIC0xNTksNiArMTYwLDE0IEBAIHN0cnVjdCByaXNj
dl9wbXVfc25hcHNob3RfZGF0YSB7Cj4gICAgICAgICB1NjQgcmVzZXJ2ZWRbNDQ3XTsKPiAgfTsK
Pgo+ICtzdHJ1Y3QgcmlzY3ZfcG11X2V2ZW50X2luZm8gewo+ICsgICAgICAgdTMyIGV2ZW50X2lk
eDsKPiArICAgICAgIHUzMiBvdXRwdXQ7Cj4gKyAgICAgICB1NjQgZXZlbnRfZGF0YTsKPiArfTsK
PiArCj4gKyNkZWZpbmUgUklTQ1ZfUE1VX0VWRU5UX0lORk9fT1VUUFVUX01BU0sgMHgwMQo+ICsK
PiAgI2RlZmluZSBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0sgR0VOTUFTS19VTEwoNDcsIDApCj4g
ICNkZWZpbmUgUklTQ1ZfUE1VX1BMQVRfRldfRVZFTlRfTUFTSyBHRU5NQVNLX1VMTCg2MSwgMCkK
PiAgLyogU0JJIHYzLjAgYWxsb3dzIGV4dGVuZGVkIGhwbWV2ZW50WCB3aWR0aCB2YWx1ZSAqLwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4IDM2NDRiZWQ0YzhhYi4uYTZjNDc5Zjg1M2UxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTI5OSw2ICsyOTksNjYgQEAgc3RhdGljIHN0cnVjdCBz
YmlfcG11X2V2ZW50X2RhdGEgcG11X2NhY2hlX2V2ZW50X21hcFtQRVJGX0NPVU5UX0hXX0NBQ0hF
X01BWF0KPiAgICAgICAgIH0sCj4gIH07Cj4KPiArc3RhdGljIGludCBwbXVfc2JpX2NoZWNrX2V2
ZW50X2luZm8odm9pZCkKPiArewo+ICsgICAgICAgaW50IG51bV9ldmVudHMgPSBBUlJBWV9TSVpF
KHBtdV9od19ldmVudF9tYXApICsgUEVSRl9DT1VOVF9IV19DQUNIRV9NQVggKgo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICBQRVJGX0NPVU5UX0hXX0NBQ0hFX09QX01BWCAqIFBFUkZfQ09VTlRf
SFdfQ0FDSEVfUkVTVUxUX01BWDsKPiArICAgICAgIHN0cnVjdCByaXNjdl9wbXVfZXZlbnRfaW5m
byAqZXZlbnRfaW5mb19zaG1lbTsKPiArICAgICAgIHBoeXNfYWRkcl90IGJhc2VfYWRkcjsKPiAr
ICAgICAgIGludCBpLCBqLCBrLCByZXN1bHQgPSAwLCBjb3VudCA9IDA7Cj4gKyAgICAgICBzdHJ1
Y3Qgc2JpcmV0IHJldDsKPiArCj4gKyAgICAgICBldmVudF9pbmZvX3NobWVtID0ga2NhbGxvYyhu
dW1fZXZlbnRzLCBzaXplb2YoKmV2ZW50X2luZm9fc2htZW0pLCBHRlBfS0VSTkVMKTsKPiArICAg
ICAgIGlmICghZXZlbnRfaW5mb19zaG1lbSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50
X21hcCk7IGkrKykKPiArICAgICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5l
dmVudF9pZHggPSBwbXVfaHdfZXZlbnRfbWFwW2ldLmV2ZW50X2lkeDsKPiArCj4gKyAgICAgICBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfbWFwKTsgaSsrKSB7Cj4g
KyAgICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVu
dF9tYXBbaV0pOyBqKyspIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGsgPSAwOyBr
IDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfbWFwW2ldW2pdKTsgaysrKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5ldmVudF9p
ZHggPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcG11X2NhY2hlX2V2ZW50X21hcFtpXVtqXVtrXS5ldmVudF9pZHg7Cj4gKyAgICAgICAg
ICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gKyAgICAgICBiYXNlX2FkZHIgPSBfX3BhKGV2ZW50
X2luZm9fc2htZW0pOwo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiAr
ICAgICAgICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9F
VkVOVF9HRVRfSU5GTywgbG93ZXJfMzJfYml0cyhiYXNlX2FkZHIpLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdXBwZXJfMzJfYml0cyhiYXNlX2FkZHIpLCBjb3VudCwgMCwgMCwg
MCk7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklf
RVhUX1BNVSwgU0JJX0VYVF9QTVVfRVZFTlRfR0VUX0lORk8sIGJhc2VfYWRkciwgMCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50LCAwLCAwLCAwKTsKPiArICAgICAgIGlm
IChyZXQuZXJyb3IpIHsKPiArICAgICAgICAgICAgICAgcmVzdWx0ID0gLUVPUE5PVFNVUFA7Cj4g
KyAgICAgICAgICAgICAgIGdvdG8gZnJlZV9tZW07Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
Zm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50X21hcCk7IGkrKykgewo+ICsg
ICAgICAgICAgICAgICBpZiAoIShldmVudF9pbmZvX3NobWVtW2ldLm91dHB1dCAmIFJJU0NWX1BN
VV9FVkVOVF9JTkZPX09VVFBVVF9NQVNLKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwbXVf
aHdfZXZlbnRfbWFwW2ldLmV2ZW50X2lkeCA9IC1FTk9FTlQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgY291bnQgPSBBUlJBWV9TSVpFKHBtdV9od19ldmVudF9tYXApOwo+ICsKPiArICAgICAg
IGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXApOyBpKyspIHsK
PiArICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IEFSUkFZX1NJWkUocG11X2NhY2hlX2V2
ZW50X21hcFtpXSk7IGorKykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZvciAoayA9IDA7
IGsgPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal0pOyBrKyspIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghKGV2ZW50X2luZm9fc2htZW1bY291bnRd
Lm91dHB1dCAmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9Q
TVVfRVZFTlRfSU5GT19PVVRQVVRfTUFTSykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal1ba10uZXZlbnRfaWR4ID0gLUVO
T0VOVDsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50Kys7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+
ICtmcmVlX21lbToKPiArICAgICAgIGtmcmVlKGV2ZW50X2luZm9fc2htZW0pOwo+ICsKPiArICAg
ICAgIHJldHVybiByZXN1bHQ7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHBtdV9zYmlfY2hlY2tf
ZXZlbnQoc3RydWN0IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4gIHsKPiAgICAgICAgIHN0
cnVjdCBzYmlyZXQgcmV0Owo+IEBAIC0zMTYsNiArMzc2LDE1IEBAIHN0YXRpYyB2b2lkIHBtdV9z
YmlfY2hlY2tfZXZlbnQoc3RydWN0IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4KPiAgc3Rh
dGljIHZvaWQgcG11X3NiaV9jaGVja19zdGRfZXZlbnRzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykKPiAgewo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBpZiAoc2JpX3YzX2F2YWls
YWJsZSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX2NoZWNrX2V2ZW50X2luZm8o
KTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBw
cl9lcnIoInBtdV9zYmlfY2hlY2tfZXZlbnRfaW5mbyBmYWlsZWQgd2l0aCBlcnJvciAlZFxuIiwg
cmV0KTsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAg
IGZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShwbXVfaHdfZXZlbnRfbWFwKTsgaSsrKQo+
ICAgICAgICAgICAgICAgICBwbXVfc2JpX2NoZWNrX2V2ZW50KCZwbXVfaHdfZXZlbnRfbWFwW2ld
KTsKPgo+Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
