From: Vineet Gupta <vineetg@rivosinc.com>
Date: Mon, 30 Jan 2023 10:38:24 -0800
Subject: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
In-Reply-To: <CABgGipWndcnUxUvWtyxyETtLaJT42VaZoiat7uDmnOjREEt9tg@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com> <Y9GZbVrZxEZAraVu@spud>
 <CABgGipWndcnUxUvWtyxyETtLaJT42VaZoiat7uDmnOjREEt9tg@mail.gmail.com>
Message-ID: <c5470393-af09-e86b-b388-d6b830451e8f@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/29/23 22:38, Andy Chiu wrote:
>>> +     default n
>> I forget, but is the reason for this being default n, when the others
>> are default y a conscious choice?
> Yes, I think it could be y if V is allocated in the first-use trap, as
> far as I'm concerned. Hey Vineet, do you have any comments about that?

Yes I think this can be enabled by default now that everything is 
allocated on demand.
FWIW thread_struct would have 5 word overhead due to struct 
__riscv_v_state but nothing I would worry about too much.

-Vineet

