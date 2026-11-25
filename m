Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B1606A31E
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ep6r3/Tg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KJlMsm5k1GEn9YLWeBxNRaR6ilevBuGD0TIUnosdKnY=; b=Ep6r3/Tgbu1YijM+dpfRlhf5wA
	fV1sj3o4SMEyOgK8L8Wvxs2BSQXQcfn/cWg6ArrBdBIOnyPwQyCCWn86x5kC/UnATxxbEUuPELL1S
	fr7GjMZ+bNl9Qj2NXo2lVDzAjDl0AZ04xMG199oE1W7axiqOi3bJB1QNl2maXBFmhszKtrCduiwWq
	SzoPOLQtxB8libR3L2jTZNum6yYZPTys/rU+BAaP4gFJmU74axBAhE60xRr8rO60qVU4bm/04tc1n
	Nqx9cT6aESZAYHrSgfLQ47HRc5Up+GaaMUbnmSrGICxoeXfS+mtS+bFQVRuF02ZQZywlJzttlkvQ5
	NPhUW0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1fE-00000008B68-3Oi3;
	Wed, 25 Nov 2026 01:19:12 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1fA-00000008B5o-2zNi
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:19:11 +0000
Received: from [127.0.0.1] (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowABncJGENwZr0nO8AQ--.444S2;
	Wed, 25 Nov 2026 09:19:02 +0800 (CST)
Message-ID: <a9e29922b006ee2c5b89870f6730cc7ea6fcff48.camel@iscas.ac.cn>
Subject: Re: [kvm-unit-tests PATCH v2 8/8] riscv: Add BRS SBI requirement
 tests
From: Xiang W <wangxiang@iscas.ac.cn>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, pbonzini@redhat.com,
 	thuth@redhat.com
Date: Wed, 25 Nov 2026 09:19:00 +0800
In-Reply-To: <awXH92cKFHKZKPFp@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
	 <20261105082035.133680-9-wangxiang@iscas.ac.cn> <awAxIHVLgbqTIYq5@orel>
	 <be563f376884fa46178aa4f78468aeb13272506f.camel@iscas.ac.cn>
	 <awXH92cKFHKZKPFp@orel>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABncJGENwZr0nO8AQ--.444S2
X-Coremail-Antispam: 1UD129KBjvdXoWrXFWDXF4DCF45tryrWr18Grg_yoWxWwc_uF
	W0yr18Cwsrt3Wjkan3tF4Svrn3KFs2g3W8ZrWUt39aqF45AF93CrsYg34Sy3ZxGr4kGFsF
	gr4Y939rCryjgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2AYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jrYFAUUUUU=
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_171909_145227_1B04798E 
X-CRM114-Status: GOOD (  11.05  )
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMjTkuoznmoQgMTg6MjQgKzAxMDDvvIxBbmRyZXcgSm9uZXPlhpnpgZPvvJoK
PiBPbiBUdWUsIE5vdiAyNCwgMjAyNiBhdCAwODo1MDoyMFBNICswODAwLCBYaWFuZyBXIHdyb3Rl
Ogo+ID4gPiAKPiA+ID4gSSd2ZSBzZW50IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MTEyMDEzNTYxMy4xMzg4NjQ3LTEtYW5kcmV3LmpvbmVzQGxpbnV4LmRldi8KPiA+ID4gdG8gYXZv
aWQgaGF2aW5nIHRvIGRvIGFsbCB0aGlzIERUIHBhcnNpbmcgaW4gdGhlIHRlc3QgY29kZS4gWW91
ciBuZXh0Cj4gPiA+IHZlcnNpb24gc2hvdWxkIGFkZCBhIHBhdGNoIHRoYXQgYWRkcyB0aGUgQUNQ
SSBzdXBwb3J0IGZvciBzZXR0aW5nCj4gPiA+IHRocmVhZF9pbmZvLmltc2ljX2FkZHIgYW5kIHRo
ZW4gdGhpcyBwYXRjaCBzaG91bGQgdXNlIGl0Lgo+ID4gPiAKPiA+IFRoYW5rcyBmb3Igd3JpdGlu
ZyB0aGF0IGhlbHBlci4KPiA+IAo+ID4gdjMgd2lsbCBjYXJyeSB5b3VyIERUIHBhdGNoIGFuZCBh
ZGQgdGhlIEFDUEkgc2lkZS4gVGhlIEJSUyB0ZXN0cyB0aGVuwqAKPiA+IGp1c3QgcmVhZCBjcHVz
W10uaW1zaWNfYWRkci4KPiAKPiBMZXQncyByZW5hbWUgaW1zaWNfYWRkciB0byBpbXNpY19wYQpP
SwoKVGhhbmtzLApYaWFuZwo+IAo+IFRoYW5rcywKPiBkcmV3CgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
